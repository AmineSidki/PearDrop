package com.aminesidki.dragnshare.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/file")
public class ShareController{
    @GetMapping("/msg")
    public String helloMessage(){
        return "Hello dude !";
    }
}
