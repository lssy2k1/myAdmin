package com.myadmin.dto;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class LecSearch {
    private String title;
    private String teacher;
    private String topic;
    private String sortOption;
    //sortOption에 아래 벨류 넣을 것
//    private Integer rating;
//    private Integer hit;
//    private String rdate;

}
