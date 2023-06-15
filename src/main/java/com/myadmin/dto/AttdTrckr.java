package com.myadmin.dto;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class AttdTrckr {
    private String stdnId;
    private String month;
    private String day;
    private String isAttend;
//    0 결석, 1 출석, 2 지각
}
