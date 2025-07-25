package com.aminesidki.dragnshare.util;

import com.aminesidki.dragnshare.controller.ReceiveController;
import com.aminesidki.dragnshare.controller.ShareController;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.util.HashSet;
import java.util.Set;

@Component
public class ModeSwitch implements CommandLineRunner {

    @Value("${mode}")
    private String mode ;

    @Override
    public void run(String... args) throws Exception {
        if(mode.equalsIgnoreCase("s")){
            ShareController.writer = new UdpDiscoveryWriter();
        }else if(mode.equalsIgnoreCase("r")){
            Set<String> devices = new HashSet<>();
            FileMonitor monitor = new FileMonitor();
            ReceiveController.devices = devices;
            ReceiveController.file = monitor;
            DevicesManager manager = new DevicesManager(devices);
            new UdpDiscoveryListener(manager).run();
            new DevicesFlusher(manager).run();
        }else{
            System.err.println("Unknown mode: " + mode);
            System.exit(1);
        }
    }
}
