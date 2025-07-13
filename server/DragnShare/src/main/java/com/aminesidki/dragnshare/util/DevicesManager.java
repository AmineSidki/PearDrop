package com.aminesidki.dragnshare.util;

import java.util.List;
import java.util.Set;

public class DevicesManager {
    Set<String> devices ;
    public DevicesManager(Set<String> devices){
        this.devices = devices ;
    }

    public synchronized void flush() throws InterruptedException {
            if(this.devices.isEmpty()){
                System.out.println("Device List Empty.");
                wait();
            }
            Thread.sleep(3000);
            devices.clear();
    }

    public synchronized void addDevice(String IP){
        if(devices.isEmpty()){
            devices.add(IP);
            notify();
        }
        else{
            devices.add(IP);
        }
    }
}
