package com.aminesidki.dragnshare.DTO;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.util.List;

@Data
public class FileDTO {
    private List<Byte> fileBytes ;

    public FileDTO(@JsonProperty("fileBytes") List<Byte> fileBytes) {
        this.fileBytes = fileBytes;
    }
}
