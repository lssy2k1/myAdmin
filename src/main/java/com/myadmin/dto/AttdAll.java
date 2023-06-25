package com.myadmin.dto;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class AttdAll {
    private String stdnId;
    private String name;
    private Integer cnt0;
    private Integer cnt1;
    private Integer cnt2;
//    0 결석, 1 출석, 2 지각
}
