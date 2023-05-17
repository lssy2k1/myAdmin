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
    private String writer;
    private String keyword;
    private String title;
    private double lat;
    private double lng;
    private String img;
    private int star;
    private String detail;

    public Marker(int id, String writer, String keyword, String title, double lat, double lng, String img, int star, String detail) {
        this.id = id;
        this.writer = writer;
        this.keyword = keyword;
        this.title = title;
        this.lat = lat;
        this.lng = lng;
        this.img = img;
        this.star = star;
        this.detail = detail;
    }

    private MultipartFile imgfile;
}
