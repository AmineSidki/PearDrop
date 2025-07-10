package com.aminesidki.dragnshare.controller;

import com.aminesidki.dragnshare.util.FileRequester;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/receive")
public class ReceiveController {
    @PostMapping("/{IP}")
    public void receiveFile(@PathVariable String IP) throws Exception {
        new FileRequester(IP).run();
    }
}
