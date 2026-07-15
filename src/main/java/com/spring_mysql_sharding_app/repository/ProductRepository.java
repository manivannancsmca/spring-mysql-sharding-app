package com.spring_mysql_sharding_app.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spring_mysql_sharding_app.entity.Product;

import java.time.LocalDateTime;
import java.util.List;

public interface ProductRepository extends JpaRepository<Product, String> {
    List<Product> findByCreationdateBetween(LocalDateTime start, LocalDateTime end);
}
