package com.spring_mysql_sharding_app.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spring_mysql_sharding_app.entity.Product;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

public interface ProductRepository extends JpaRepository<Product, String> {
    List<Product> findByCreationDateBetween(LocalDateTime start, LocalDateTime end);

    Optional<Product> findByProductId(String productId);
}
