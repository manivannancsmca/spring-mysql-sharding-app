package com.spring_mysql_sharding_app.config;

public class ShardContext {
    private static final ThreadLocal<String> CONTEXT = new ThreadLocal<>();

    public static void setShard(String shardTarget) {
        CONTEXT.set(shardTarget);
    }

    public static String getShard() {
        return CONTEXT.get() != null ? CONTEXT.get() : "lookup"; // Default database
    }

    public static void clear() {
        CONTEXT.remove();
    }
}
