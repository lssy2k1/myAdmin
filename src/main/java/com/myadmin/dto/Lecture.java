package com.myadmin.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Lecture {
    private Integer id;
    private Integer lectureCode;
    private String admId;
    private String title;
    private String teacher;
    private String topic;
    private String target;
    private String rdate;
    private String length;
    private double rating;
    private Integer price;
    private String img;
    private double discountRate;
    private String isDelete;
    private String deleteDate;
    private Integer hit;

    private MultipartFile imgfile;
}
