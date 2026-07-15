package com.spring_mysql_sharding_app.service;

import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.hash.Hashing;
import com.spring_mysql_sharding_app.config.ShardContext;
import com.spring_mysql_sharding_app.entity.Product;
import com.spring_mysql_sharding_app.entity.ProductSearchIndex;
import com.spring_mysql_sharding_app.repository.LookupRepository;
import com.spring_mysql_sharding_app.repository.ProductRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProductService {

    private LookupRepository lookupRepository;
    private ProductRepository productRepository;

    // 1. UUID Hashing Algorithm (Deterministic modulo 5)
    private int determineShardId(String uuid) {
        int hash = Hashing.murmur3_32_fixed().hashString(uuid, StandardCharsets.UTF_8).asInt();
        return Math.abs(hash % 5) + 1;
    }

    @Transactional
    public Product saveProduct(Product product) {

        String uuid = UUID.randomUUID().toString();
        product.setProductId(uuid);
        product.setCreationdate(LocalDateTime.now());

        int shardId = determineShardId(uuid);

        // A. Save to Lookup DB
        ShardContext.setShard("lookup");

        ProductSearchIndex index = new ProductSearchIndex();
        index.setProductId(uuid);
        index.setName(product.getName());
        index.setBrandname(product.getBrandname());
        index.setShardId(shardId);
        lookupRepository.save(index);

        // B. Save to target Shard DB
        ShardContext.setShard("shard" + shardId);
        Product savedProduct = productRepository.save(product);

        ShardContext.clear();
        return savedProduct;
    }

    public Optional<Product> getProductById(String productId) {

        ShardContext.setShard("lookup");
        Optional<ProductSearchIndex> indexOpt = lookupRepository.findById(productId);

        if (indexOpt.isEmpty())
            return Optional.empty();

        int shardId = indexOpt.get().getShardId();
        ShardContext.setShard("shard" + shardId);

        Optional<Product> product = productRepository.findById(productId);

        ShardContext.clear();
        return product;
    }

    public Page<Product> searchByNameWithPagination(String name, int page, int size) {
        Pageable pageable = PageRequest.of(page, size);

        ShardContext.setShard("lookup");

        Page<ProductSearchIndex> indexPage = lookupRepository.findByNameContainingIgnoreCase(name, pageable);

        Map<Integer, List<String>> shardGroups = indexPage.getContent().stream()
                .collect(Collectors.groupingBy(
                        ProductSearchIndex::getShardId,
                        Collectors.mapping(ProductSearchIndex::getProductId, Collectors.toList())));

        List<Product> finalProducts = new ArrayList<>();
        shardGroups.forEach((shardId, ids) -> {
            ShardContext.setShard("shard" + shardId);
            finalProducts.addAll(productRepository.findAllById(ids));
        });

        Map<String, Product> productMap = finalProducts.stream()
                .collect(Collectors.toMap(Product::getProductId, p -> p));

        List<Product> sortedProducts = indexPage.getContent().stream()
                .map(index -> productMap.get(index.getProductId()))
                .filter(Objects::nonNull)
                .collect(Collectors.toList());

        ShardContext.clear();
        return new PageImpl<>(sortedProducts, pageable, indexPage.getTotalElements());
    }

    public List<Product> searchByCreationDate(LocalDateTime start, LocalDateTime end) {
        List<Product> combinedResult = new ArrayList<>();

        for (int i = 1; i <= 5; i++) {
            ShardContext.setShard("shard" + i);
            combinedResult.addAll(productRepository.findByCreationdateBetween(start, end));
        }

        ShardContext.clear();
        // அப்ளிகேஷன் லெவலில் தேதியை Sort செய்தல்
        combinedResult.sort(Comparator.comparing(Product::getCreationdate).reversed());
        return combinedResult;
    }
}
