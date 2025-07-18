package com.aminesidki.dragnshare.DTO;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.util.List;

@Data
public class FileDTO {
    private List<Byte> fileBytes ;
    private String fileName;

    public FileDTO(@JsonProperty("fileBytes") List<Byte> fileBytes , @JsonProperty("fileName") String fileName) {
        this.fileName = fileName;
        this.fileBytes = fileBytes;
    }
}
