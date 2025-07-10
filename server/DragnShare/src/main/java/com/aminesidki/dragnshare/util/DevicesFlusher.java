package com.aminesidki.dragnshare.util;

import org.springframework.boot.CommandLineRunner;

import java.util.List;

public class DevicesFlusher implements CommandLineRunner {
    List<String> devices;
    public DevicesFlusher(List<String> devices){
        this.devices = devices;
    }

    @Override
    public void run(String... args) throws Exception {
        new Thread(()->{
            try {
                flush();
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
        }).run();
    }

    private synchronized void flush() throws InterruptedException {
        while (true) {
            if(devices.isEmpty()){
                wait();
            }
            Thread.sleep(3000);
            for (String s : devices) {
                devices.remove(s);
            }
        }
    }
}
