package com.aminesidki.dragnshare.util;

import org.springframework.boot.CommandLineRunner;

import java.net.DatagramPacket;
import java.net.DatagramSocket;

public class UdpDiscoveryListener implements CommandLineRunner {
    private DevicesManager manager;

    public UdpDiscoveryListener(DevicesManager manager){
        this.manager = manager;
    }

    @Override
    public void run(String... args) throws Exception {
        new Thread(this::startListening).start();
    }

    private void startListening(){
        try(DatagramSocket socket = new DatagramSocket(8888)){
            byte[] buffer = new byte[15];
            while(true){
                DatagramPacket packet = new DatagramPacket(buffer , buffer.length);
                socket.receive(packet);
                String msg = new String(packet.getData(), 0, packet.getLength());
                manager.addDevice(msg);
                System.out.println(msg);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
