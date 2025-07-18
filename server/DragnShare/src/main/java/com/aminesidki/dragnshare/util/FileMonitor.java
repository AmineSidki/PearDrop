package com.aminesidki.dragnshare.util;

import com.aminesidki.dragnshare.DTO.FileDTO;

public class FileMonitor {
    private FileDTO file = null;

    public synchronized void setFile(FileDTO file) throws InterruptedException {
        if(this.file != null){
            wait();
        }
        this.file = file;
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
