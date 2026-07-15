package com.spring_mysql_sharding_app.service;

import com.spring_mysql_sharding_app.config.ShardContext;
import com.spring_mysql_sharding_app.entity.Product;
import com.spring_mysql_sharding_app.entity.ProductSearchIndex;
import com.spring_mysql_sharding_app.repository.LookupRepository;
import com.spring_mysql_sharding_app.repository.ProductRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.jdbc.core.JdbcTemplate;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ShardRoutingService {

    private final LookupRepository lookupRepository;
    private final ProductRepository productRepository;
    private final PlatformTransactionManager transactionManager;
    private final JdbcTemplate jdbcTemplate;

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

    public Optional<Product> getProductFromShard(String productId, int shardId) {
        ShardContext.setShard("shard" + shardId);

        TransactionTemplate txTemplate = new TransactionTemplate(transactionManager);
        txTemplate.setPropagationBehavior(TransactionTemplate.PROPAGATION_REQUIRES_NEW);
        txTemplate.setReadOnly(true);

        try {
            return txTemplate.execute(status -> {
                entityManager.clear();
                
                System.out.println("--- Executing Query for Shard: " + shardId + " ---");

                String productResult = jdbcTemplate.queryForObject(
                        "SELECT name FROM products WHERE product_id = ?",
                        String.class,
                        productId);

                System.out.println("Direct JDBC Result :::: " + productResult);

                return productRepository.findByProductIdNative(productId.trim());
            });
        } finally {
            ShardContext.clear();
        }
    }
}