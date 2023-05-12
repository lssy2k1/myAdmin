package com.myadmin.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Marker {
    private int id;
    private String title;
    private Double lat;
    private Double lng;
    private String img;
    private int star;
    private String detail;

    private MultipartFile imgfile;
}
