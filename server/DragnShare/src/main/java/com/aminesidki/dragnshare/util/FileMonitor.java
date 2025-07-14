package com.aminesidki.dragnshare.util;

public class FileMonitor {
    private String file = null;

    public synchronized void setFile(String file) throws InterruptedException {
        if(this.file != null){
            System.out.println("file is not null !");
            wait();
        }
        System.out.println("file is null !");
        this.file = file;
        System.out.println("file is not null anymore !");
        notify();
    }

    public synchronized String getFile() throws InterruptedException {
        if(file == null)
        {
            wait();
        }
        String tmp = file ;
        file = null;
        notify();
        return tmp;
    }
}
