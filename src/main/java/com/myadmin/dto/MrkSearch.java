package com.myadmin.dto;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class MrkSearch {
    private String writer;
    private String keyword;
    private String title;
    private Integer rating;
}
