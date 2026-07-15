package com.spring_mysql_sharding_app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.hibernate.autoconfigure.HibernateJpaAutoConfiguration;
import org.springframework.boot.jdbc.autoconfigure.DataSourceAutoConfiguration;

@SpringBootApplication
public class SpringMysqlShardingAppApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringMysqlShardingAppApplication.class, args);
	}

}
