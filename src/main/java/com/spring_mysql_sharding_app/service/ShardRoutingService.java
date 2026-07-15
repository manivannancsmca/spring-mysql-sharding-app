package com.spring_mysql_sharding_app.service;

import com.spring_mysql_sharding_app.config.ShardContext;
import com.spring_mysql_sharding_app.entity.Product;
import com.spring_mysql_sharding_app.entity.ProductSearchIndex;
import com.spring_mysql_sharding_app.repository.LookupRepository;
import com.spring_mysql_sharding_app.repository.ProductRepository;
import com.spring_mysql_sharding_app.util.ConsistentHashRouter;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.support.TransactionTemplate;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ShardRoutingService {

    private final LookupRepository lookupRepository;
    private final ProductRepository productRepository;
    private final PlatformTransactionManager transactionManager;
    private final ConsistentHashRouter consistentHashRouter;

    @PersistenceContext
    private final EntityManager entityManager;

    public Optional<ProductSearchIndex> getLookupIndex(String productId) {
        ShardContext.setShard("lookup");

        TransactionTemplate txTemplate = new TransactionTemplate(transactionManager);
        txTemplate.setPropagationBehavior(TransactionTemplate.PROPAGATION_REQUIRES_NEW);
        txTemplate.setReadOnly(true);

        try {
            return txTemplate.execute(status -> lookupRepository.findById(productId));
        } finally {
            ShardContext.clear();
        }
    }

    public Optional<Product> getProductFromShard(String productId) {
        // 2. பழைய "Math.abs(hash % 5)" கணக்கீட்டிற்குப் பதிலாக
        // Consistent Hashing மூலம் ஷார்ட் பெயரைப் பெறுகிறோம்
        String targetShard = consistentHashRouter.getShard(productId); // இது "shard5" அல்லது "shard2" எனத் தரும்

        System.out.println(">>> Consistent Hashing Routed " + productId + " to: " + targetShard);

        // 3. கண்டறிந்த ஷார்ட் பெயரை அப்படியே த்ரெட் லோக்கலில் செட் செய்கிறோம்
        ShardContext.setShard(targetShard);

        TransactionTemplate txTemplate = new TransactionTemplate(transactionManager);
        txTemplate.setPropagationBehavior(TransactionTemplate.PROPAGATION_REQUIRES_NEW);
        txTemplate.setReadOnly(true);

        try {
            return txTemplate.execute(status -> {
                entityManager.clear();

                return productRepository.findByProductIdNative(productId.trim());
            });
        } finally {
            ShardContext.clear();
        }
    }
}