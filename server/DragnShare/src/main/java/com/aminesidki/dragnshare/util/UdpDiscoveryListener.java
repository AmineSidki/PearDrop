package com.aminesidki.dragnshare.util;

import org.springframework.boot.CommandLineRunner;

import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.util.List;

public class UdpDiscoveryListener implements CommandLineRunner {

    private List<String> devices;
    public UdpDiscoveryListener(List<String> devices){
        this.devices = devices ;
    }

    @Override
    public void run(String... args) throws Exception {
        new Thread(this::startListening).start();
    }

    private synchronized void startListening(){
        try(DatagramSocket socket = new DatagramSocket(8888)){
            byte[] buffer = new byte[15];
            new DevicesFlusher(devices).run();
            while(true){
                DatagramPacket packet = new DatagramPacket(buffer , buffer.length);
                socket.receive(packet);
                String msg = new String(packet.getData(), 0, packet.getLength());
                if(devices.isEmpty()){
                    devices.add(msg);
                    notify();
                }else{
                    devices.add(msg);
                }
                System.out.println(msg);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
