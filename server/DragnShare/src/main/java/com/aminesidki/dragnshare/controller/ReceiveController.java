package com.aminesidki.dragnshare.controller;

import com.aminesidki.dragnshare.util.FileRequester;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Set;

@RestController
@RequestMapping("/receive")
public class ReceiveController {
    public static Set<String> devices;

    @PostMapping("/{IP}")
    public void receiveFile(@PathVariable String IP) throws Exception {
        new FileRequester(IP).run();
    }

    @GetMapping("/devices")
    public ResponseEntity<Set<String>> nearbyDevices(){
        if (devices != null){
            return new ResponseEntity<>( devices , HttpStatus.OK );
        }
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
}
