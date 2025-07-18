package com.aminesidki.dragnshare.controller;

import com.aminesidki.dragnshare.DTO.FileDTO;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/share/file")
public class ShareController{
    static FileDTO file;

    @GetMapping("/msg")
    public String helloMessage(){
        return "Hello dude !";
    }

    @PostMapping("/receive")
    public void receiveFromClient(@RequestBody FileDTO incoming){
        System.out.println("reached !");
        file = incoming;
        System.out.println(incoming);
    }

    @GetMapping("/")
    public FileDTO sendFile(){
        return file;
    }
}
