package com.aminesidki.dragnshare.util;

import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;

public class FileRequester implements CommandLineRunner {
    private String IP;

    public FileRequester(String IP){
        this.IP = IP;
    }

    @Override
    public void run(String... args) throws Exception {
        new Thread(()->resRequester(IP)).start();
    }

    private void resRequester(String IP){
        try{
            URL url = new URL( "http://" + IP + ":8080/file/msg");
            System.out.println("not yet !");
            HttpURLConnection con = (HttpURLConnection) url.openConnection() ;
            con.setRequestMethod("GET");

            System.out.println("connected !");

            Scanner scanner = new Scanner(con.getInputStream());
            StringBuilder response = new StringBuilder();
            while(scanner.hasNext()){
                response.append(scanner.nextLine());
            }
            System.out.println(response);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
