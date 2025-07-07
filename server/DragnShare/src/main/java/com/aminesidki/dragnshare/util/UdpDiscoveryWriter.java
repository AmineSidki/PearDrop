package com.aminesidki.dragnshare.util;


import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.nio.charset.StandardCharsets;

public class UdpDiscoveryWriter implements CommandLineRunner {

    @Override
    public void run(String... args) throws Exception {
        new Thread(this::broadcast).start();
    }

    private String getLocalIP(){
        try(DatagramSocket socket = new DatagramSocket()){
            socket.connect(InetAddress.getByName("8.8.8.8"),10002);
            System.out.println("Current Address :" + socket.getLocalAddress().getHostAddress());
            return socket.getLocalAddress().getHostAddress();
        }catch(Exception e){
            return "127.0.0.1";
        }
    }

    private void broadcast(){
        try(DatagramSocket socket = new DatagramSocket(8888)){
            String msg = getLocalIP();
            byte[] buffer = msg.getBytes(StandardCharsets.UTF_8);
            InetAddress broadcast = InetAddress.getByName("192.168.1.255");
            DatagramPacket packet = new DatagramPacket(buffer, buffer.length ,broadcast, 8888);

            while(true){
                socket.send(packet);
                System.out.println("Packet sent !");
                Thread.sleep(3000);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
