package com.myadmin.dto;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class MarkerSearch {
    private String writer;
    private String keyword;
    private String title;
    private Integer star;
}
