package com.spring_mysql_sharding_app.service;

import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring_mysql_sharding_app.config.ShardContext;
import com.spring_mysql_sharding_app.entity.Product;
import com.spring_mysql_sharding_app.entity.ProductSearchIndex;
import com.spring_mysql_sharding_app.repository.LookupRepository;
import com.spring_mysql_sharding_app.repository.ProductRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ShardRoutingService {

    private final LookupRepository lookupRepository;
    private final ProductRepository productRepository;

    @Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
    public Optional<ProductSearchIndex> getLookupIndex(String productId) {
        ShardContext.setShard("lookup");
        try {
            return lookupRepository.findById(productId);
        } finally {
            ShardContext.clear();
        }
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = true)
    public Optional<Product> getProductFromShard(String productId, int shardId) {
        System.out.println("productId ::: " + productId);
        System.out.println("shardId ::: " + shardId);
        ShardContext.setShard("shard" + shardId);
        try {
            return productRepository.findByProductId(productId);
        } finally {
            ShardContext.clear();
        }
    }
}
