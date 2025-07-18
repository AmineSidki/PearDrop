package com.aminesidki.dragnshare.util;

import com.aminesidki.dragnshare.DTO.FileDTO;
import com.fasterxml.jackson.databind.ObjectMapper;
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
            URL url = new URL( "http://" + IP + ":8080/share/file/");
            HttpURLConnection con = (HttpURLConnection) url.openConnection() ;
            con.setRequestMethod("GET");

            System.out.println("connected !");

            Scanner scanner = new Scanner(con.getInputStream());
            StringBuilder response = new StringBuilder();
            while(scanner.hasNext()){
                response.append(scanner.nextLine());
            }
            ObjectMapper mapper = new ObjectMapper();
            System.out.println("response :  "  + response);
            monitor.setFile(mapper.readValue(response.toString() , FileDTO.class));
            System.out.println(response);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
