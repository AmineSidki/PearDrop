package com.aminesidki.dragnshare;

import com.aminesidki.dragnshare.util.ServerKiller;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;

@SpringBootApplication
public class DragnShareApplication {
    public static void main(String[] args) {
         ServerKiller.context = SpringApplication.run(DragnShareApplication.class, args);
    }

}
