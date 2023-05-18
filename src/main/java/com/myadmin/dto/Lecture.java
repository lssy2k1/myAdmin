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
    private int id;
    @NotEmpty(message = "title는 필수항목입니다.")
    private String title;
    @NotEmpty(message = "teacher는 필수항목입니다.")
    private String teacher;
    private String topic;
    @NotEmpty(message = "target는 필수항목입니다.")
    private String target;
    private String rdate;
    @NotNull(message = "length는 필수항목입니다.")
    private Integer length;
    @NotNull(message = "rating는 필수항목입니다.")
    private Integer rating;
    @NotNull(message = "price는 필수항목입니다.")
    private Integer price;
    private String img;

    public Lecture(int id, String title, String teacher, String topic, String target, String rdate, Integer length, Integer rating, Integer price, String img) {
        this.id = id;
        this.title = title;
        this.teacher = teacher;
        this.topic = topic;
        this.target = target;
        this.rdate = rdate;
        this.length = length;
        this.rating = rating;
        this.price = price;
        this.img = img;
    }

    private MultipartFile imgfile;
}
