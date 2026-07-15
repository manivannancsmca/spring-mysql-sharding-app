package com.spring_mysql_sharding_app.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "products")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Product {
    @Id
    private String productId;
    private String name;
    private String brandname;
    private int quantity;
    private double price;
    private LocalDateTime creationdate;
}
