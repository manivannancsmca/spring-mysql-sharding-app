package com.spring_mysql_sharding_app.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "product_search_index", indexes = { @Index(name = "idx_search", columnList = "brandname, name") })
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductSearchIndex {
    @Id
    private String productId;
    private String name;
    private String brandname;
    private int shardId;
}
