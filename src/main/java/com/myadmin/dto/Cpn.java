package com.myadmin.dto;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Cpn {
    private Integer id;
    private String stdnId;
    private String giveDate;
    private String validDate;
    private String isUsed;
}
