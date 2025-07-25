package com.aminesidki.dragnshare.controller;

import com.aminesidki.dragnshare.DTO.FileDTO;
import com.aminesidki.dragnshare.util.UdpDiscoveryWriter;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/share/file")
public class ShareController{
    static FileDTO file;
    public static UdpDiscoveryWriter writer;

    @GetMapping("/msg")
    public String helloMessage(){
        return "Hello dude !";
    }

    @PostMapping("/receive")
    public void receiveFromClient(@RequestBody FileDTO incoming){
        if(writer != null){
            System.out.println("reached !");
            file = incoming;
            System.out.println("Name : " + file.getFileName());
            System.out.println("Bytes : " + file.getFileBytes());
            try{
                writer.run();
            }catch(Exception e){
                throw new RuntimeException("Unable to run writer thread");
            }
        }
        else{
            throw new RuntimeException("Invalid Route !");
        }
    }

    @GetMapping("/")
    public FileDTO sendFile(){
        if(writer != null){
            return file;
        }else{
            throw new RuntimeException("Invalid Route !");
        }
    }
}
