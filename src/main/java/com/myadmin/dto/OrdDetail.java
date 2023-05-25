package com.myadmin.dto;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class OrdDetail {
    private Integer id;
    private Integer lecId;
    private Integer ordId;
    private String stdyHour;
}
