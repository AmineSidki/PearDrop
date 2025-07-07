package com.aminesidki.dragnshare.util;

import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.net.DatagramPacket;
import java.net.DatagramSocket;

public class UdpDiscoveryListener implements CommandLineRunner {

    @Override
    public void run(String... args) throws Exception {
        new Thread(this::startListening).start();
    }

    private void startListening(){
        try(DatagramSocket socket = new DatagramSocket(8888)){
            byte[] buffer = new byte[10];
            while(true){
                System.out.println("Iteration !");
                DatagramPacket packet = new DatagramPacket(buffer , buffer.length);
                socket.receive(packet);
                String msg = new String(packet.getData(), 0, packet.getLength());
                System.out.println(msg);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
