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
    private Integer rating;
    private Integer lowerPrice;
    private Integer upperPrice;

}
