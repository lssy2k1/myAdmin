package com.myadmin.dto;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Attd {
    private Integer id;
    private String stdnId;
    private String rdate;
    private String startTime;
    private String endTime;
    private String isAttend;
//    0 결석, 1 출석, 2 지각
}
