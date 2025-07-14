package com.aminesidki.dragnshare.util;

import org.springframework.boot.CommandLineRunner;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;

public class FileRequester implements CommandLineRunner {
    private String IP;
    private FileMonitor monitor;

    public FileRequester(String IP , FileMonitor monitor){
        this.IP = IP;
        this.monitor = monitor;
    }

    @Override
    public void run(String... args) throws Exception {
        new Thread(()->resRequester(IP)).start();
    }

    private void resRequester(String IP){
        try{
            URL url = new URL( "http://" + IP + ":8080/share/file/msg");
            HttpURLConnection con = (HttpURLConnection) url.openConnection() ;
            con.setRequestMethod("GET");

            System.out.println("connected !");

            Scanner scanner = new Scanner(con.getInputStream());
            StringBuilder response = new StringBuilder();
            while(scanner.hasNext()){
                response.append(scanner.nextLine());
            }
            monitor.setFile(response.toString());
            System.out.println(response);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
