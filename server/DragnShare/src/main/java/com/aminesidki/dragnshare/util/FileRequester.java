package com.aminesidki.dragnshare.util;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;

public class FileRequester {

    public void resRequester(String IP) throws Exception {
        URL url = new URL( "http://" + IP + "/file/msg");
        HttpURLConnection con = (HttpURLConnection) url.openConnection() ;
        con.setRequestMethod("GET");

        Scanner scanner = new Scanner(con.getInputStream());
        StringBuilder response = new StringBuilder();
        while(scanner.hasNext()){
            response.append(scanner.nextLine());
        }
        System.out.println(response);
    }
}
