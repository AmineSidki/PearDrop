package com.aminesidki.dragnshare.util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class ModeSwitch implements CommandLineRunner {

    @Value("${mode}")
    private String mode ;

    @Override
    public void run(String... args) throws Exception {
        if(mode.equalsIgnoreCase("s")){
            new UdpDiscoveryWriter().run();
        }else if(mode.equalsIgnoreCase("r")){
            List<String> devices = new ArrayList<>();
            new UdpDiscoveryListener(devices).run();
        }else{
            System.err.println("Unknown mode: " + mode);
            System.exit(1);
        }
    }
}
