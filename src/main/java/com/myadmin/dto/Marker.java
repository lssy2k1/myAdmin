package com.myadmin.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotEmpty;
import java.util.Date;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Marker {
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

    public Marker(int id, String writer, String keyword, String title, double lat, double lng, String img, double rating, String detail) {
        this.id = id;
        this.writer = writer;
        this.keyword = keyword;
        this.title = title;
        this.lat = lat;
        this.lng = lng;
        this.img = img;
        this.rating = rating;
        this.detail = detail;
    }
}
