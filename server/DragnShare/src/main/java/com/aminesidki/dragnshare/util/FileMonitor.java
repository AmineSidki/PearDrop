package com.aminesidki.dragnshare.util;

import com.aminesidki.dragnshare.DTO.FileDTO;

public class FileMonitor {
    private FileDTO file = null;

    public synchronized void setFile(FileDTO file) throws InterruptedException {
        if(this.file != null){
            System.out.println("file is not null !");
            wait();
        }
        System.out.println("file is null !");
        this.file = file;
        System.out.println("file is not null anymore !");
        notify();
    }

    public synchronized FileDTO getFile() throws InterruptedException {
        if(file == null)
        {
            wait();
        }
        FileDTO tmp = file ;
        file = null;
        notify();
        return tmp;
    }
}
