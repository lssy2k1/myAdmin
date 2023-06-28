package com.myadmin.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Stdy {
    private Integer id;
    private String writer;
    private String startTime;
    private String endTime;
    private String contents;
    private String rdate;
    private String filename;
    private String filenameOrg;

    private MultipartFile file;
    private String stdnId;

    public Stdy(String writer, String stdnId, String startTime) {
        this.writer = writer;
        this.stdnId = stdnId;
        this.startTime = startTime;
    }
}
