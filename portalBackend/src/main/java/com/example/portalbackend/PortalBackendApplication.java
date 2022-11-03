package com.example.portalbackend;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude={DataSourceAutoConfiguration.class})
public class PortalBackendApplication {

	public static void main(String[] args) {
		SpringApplication.run(PortalBackendApplication.class, args);
	}

}
