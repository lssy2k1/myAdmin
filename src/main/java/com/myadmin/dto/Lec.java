package com.myadmin.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Lec {
    private Integer id;
    private String admId;
    private Integer lecCode;
    private String title;
    private String teacher;
    private String topic;
    private String target;
    private String rdate;
    private String length;
    private double rating;
    private Integer price;
    private String img;
    private double discRate;
    private String isDelete;
    private String delDate;
    private Integer hit;

    private MultipartFile imgfile;
}
