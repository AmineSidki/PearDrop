package com.aminesidki.dragnshare.controller;

import org.springframework.boot.SpringApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aminesidki.dragnshare.util.ServerKiller;

@RestController
@RequestMapping("/health")
public class HealthController {
    @GetMapping("/isalive")
    public String isAlive(){
        return "Hello";
    }

    @GetMapping("/kill")
    public String kill(){
        SpringApplication.exit(ServerKiller.context, () -> 0);
        return "Suicide";
    }
}
