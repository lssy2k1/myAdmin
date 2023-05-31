package com.myadmin.dto;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class LecReview {
    private Integer id;
    private Integer lecId;
    private String stdnId;
    private Integer lecCode;
    private String title;
    private String contents;
    private String rdate;
    private double rating;
    private String img;
    private String isDelete;
    private String delDate;
    private String upReview;
    private Integer likes;
}
