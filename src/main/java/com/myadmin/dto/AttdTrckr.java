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

    public AttdTrckr(String stdnId, String month, String day) {
        this.stdnId = stdnId;
        this.month = month;
        this.day = day;
    }
}
