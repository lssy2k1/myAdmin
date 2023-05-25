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
}
