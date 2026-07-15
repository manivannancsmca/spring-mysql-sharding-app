package com.spring_mysql_sharding_app.config;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

public class ShardRoutingDataSource extends AbstractRoutingDataSource {
    @Override
    protected Object determineCurrentLookupKey() {
        String key = ShardContext.getShard();
        System.out.println(">>> DEBUG: Routing requested for key: [" + key + "]");
        
        if (!key.startsWith("shard") && !key.equals("lookup")) {
            System.out.println("!!! WARNING: Invalid key requested !!!");
        }
        return key;
    }
}
