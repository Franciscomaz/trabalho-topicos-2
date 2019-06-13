package com.edu.expedicao;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories("com.edu.expedicao.infrastructure.repositories")
public class ExpedicaoApplication {

    public static void main(String[] args) {
        SpringApplication.run(ExpedicaoApplication.class, args);
    }

}
