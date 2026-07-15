package com.spring_mysql_sharding_app.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import javax.sql.DataSource;
import java.util.HashMap;
import java.util.Map;

@Configuration
public class DataSourceConfig {

    @Bean
    @ConfigurationProperties(prefix = "spring.datasource.lookup")
    public DataSource lookupDataSource() { return DataSourceBuilder.create().build(); }

    @Bean
    @ConfigurationProperties(prefix = "spring.datasource.shard1")
    public DataSource shard1DataSource() { return DataSourceBuilder.create().build(); }

    @Bean
    @ConfigurationProperties(prefix = "spring.datasource.shard2")
    public DataSource shard2DataSource() { return DataSourceBuilder.create().build(); }

    @Bean
    @ConfigurationProperties(prefix = "spring.datasource.shard3")
    public DataSource shard3DataSource() { return DataSourceBuilder.create().build(); }

    @Bean
    @ConfigurationProperties(prefix = "spring.datasource.shard4")
    public DataSource shard4DataSource() { return DataSourceBuilder.create().build(); }

    @Bean
    @ConfigurationProperties(prefix = "spring.datasource.shard5")
    public DataSource shard5DataSource() { return DataSourceBuilder.create().build(); }

    @Bean
    @Primary
    public DataSource dataSource() {
        ShardRoutingDataSource routingDataSource = new ShardRoutingDataSource();
        
        Map<Object, Object> targetDataSources = new HashMap<>();
        targetDataSources.put("lookup", lookupDataSource());
        targetDataSources.put("shard1", shard1DataSource());
        targetDataSources.put("shard2", shard2DataSource());
        targetDataSources.put("shard3", shard3DataSource());
        targetDataSources.put("shard4", shard4DataSource());
        targetDataSources.put("shard5", shard5DataSource());
        
        routingDataSource.setTargetDataSources(targetDataSources);
        routingDataSource.setDefaultTargetDataSource(lookupDataSource());
        return routingDataSource;
    }
}
