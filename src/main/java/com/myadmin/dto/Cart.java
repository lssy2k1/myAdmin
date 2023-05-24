package com.myadmin.dto;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
    private int id;
    private String studentId;
    private String lectureId;
    private String rdate;

}
