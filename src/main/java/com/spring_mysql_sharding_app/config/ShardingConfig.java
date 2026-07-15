package com.spring_mysql_sharding_app.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.spring_mysql_sharding_app.util.ConsistentHashRouter;

@Configuration
public class ShardingConfig {

    // application.properties கோப்பில் இருந்து எண்ணிக்கையைப் பெறுகிறோம்
    @Value("${app.sharding.shard-count}")
    private int shardCount;

    @Bean
    public ConsistentHashRouter consistentHashRouter() {
        System.out.println(">>> Initializing ConsistentHashRouter with " + shardCount + " shards <<<");
        return new ConsistentHashRouter(shardCount);
    }
}
