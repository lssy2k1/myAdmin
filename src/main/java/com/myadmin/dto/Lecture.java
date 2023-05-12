package com.myadmin.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Lecture {
    private int id;
    private String title;
    private String teacher;
    private String topic;
    private String target;
    private String rdate;
    private String time;
    private int price;
    private String img;

    private MultipartFile imgfile;
}
