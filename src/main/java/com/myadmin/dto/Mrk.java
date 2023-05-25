package com.myadmin.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Mrk {
    private Integer id;
    private String writer;
    private double lat;
    private double lng;
    private String img;
    private double rating;
    private String detail;
    private String keyword;
    private String title;
    private String rdate;

    private MultipartFile imgfile;
}
