package com.myadmin.dto;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
    private String studentId;
    private String lectureId;
    private Integer id;
    private String rdate;
}
