package com.spring_mysql_sharding_app.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;
import org.springframework.context.annotation.Primary;

import com.zaxxer.hikari.HikariDataSource;

import javax.sql.DataSource;
import java.util.HashMap;
import java.util.Map;

@Configuration
public class DataSourceConfig {

    @Bean(name = "lookupDS")
    @ConfigurationProperties(prefix = "database.datasource.lookup")
    public HikariDataSource lookupDataSource() {
        return new HikariDataSource();
    }

    @Bean(name = "shard1DS")
    @ConfigurationProperties(prefix = "database.datasource.shard1")
    public HikariDataSource shard1DataSource() {
        return new HikariDataSource();
    }

    @Bean(name = "shard2DS")
    @ConfigurationProperties(prefix = "database.datasource.shard2")
    public HikariDataSource shard2DataSource() {
        return new HikariDataSource();
    }

    @Bean(name = "shard3DS")
    @ConfigurationProperties(prefix = "database.datasource.shard3")
    public HikariDataSource shard3DataSource() {
        return new HikariDataSource();
    }

    @Bean(name = "shard4DS")
    @ConfigurationProperties(prefix = "database.datasource.shard4")
    public HikariDataSource shard4DataSource() {
        return new HikariDataSource();
    }

    @Bean(name = "shard5DS")
    @ConfigurationProperties(prefix = "database.datasource.shard5")
    public HikariDataSource shard5DataSource() {
        return new HikariDataSource();
    }

    @Primary
    @Bean
    @DependsOn({"lookupDS", "shard1DS", "shard2DS", "shard3DS", "shard4DS", "shard5DS"})
    public DataSource dataSource() {
        ShardRoutingDataSource routingDataSource = new ShardRoutingDataSource();

        Map<Object, Object> dataSourceMap = new HashMap<>();
        dataSourceMap.put("lookup", lookupDataSource());
        dataSourceMap.put("shard1", shard1DataSource());
        dataSourceMap.put("shard2", shard2DataSource());
        dataSourceMap.put("shard3", shard3DataSource());
        dataSourceMap.put("shard4", shard4DataSource());
        dataSourceMap.put("shard5", shard5DataSource());

        routingDataSource.setTargetDataSources(dataSourceMap);
        routingDataSource.setDefaultTargetDataSource(lookupDataSource());

        // This enforces AbstractRoutingDataSource to validate and initialize its internal target map
        routingDataSource.afterPropertiesSet();

        return routingDataSource;
    }
}
