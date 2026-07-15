package com.spring_mysql_sharding_app.repository;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.spring_mysql_sharding_app.entity.ProductSearchIndex;


public interface LookupRepository extends JpaRepository<ProductSearchIndex, String> {
    // Pagination for name search
    Page<ProductSearchIndex> findByNameContainingIgnoreCase(String name, Pageable pageable);
}
