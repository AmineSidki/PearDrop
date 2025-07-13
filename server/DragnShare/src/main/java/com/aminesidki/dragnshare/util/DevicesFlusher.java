package com.aminesidki.dragnshare.util;

import org.springframework.boot.CommandLineRunner;

public class DevicesFlusher implements CommandLineRunner {
    private DevicesManager manager;

    public DevicesFlusher(DevicesManager manager){
        this.manager = manager;
    }

    @Override
    public void run(String... args) throws Exception {
        new Thread(()->{
            try {
               while(true){
                   manager.flush();
               }
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
        }).start();
    }

}
