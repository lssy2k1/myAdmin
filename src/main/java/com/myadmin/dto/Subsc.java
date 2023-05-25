package com.myadmin.dto;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Subsc {
    private Integer id;
    private String stdnId;
    private String startDate;
    private String endDate;
    private String validDate;
}
