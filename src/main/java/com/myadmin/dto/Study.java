package com.myadmin.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Study {
    private int id;
    private String writer;
    private String startTime;
    private String endTime;
    private String contents;
    private String rdate;
    private String fileName;
    private String fileName_org;

    private MultipartFile file;

}
