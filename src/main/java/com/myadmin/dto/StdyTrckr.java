package com.myadmin.dto;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class StdyTrckr {
    private String writer;
    private String startTime;
    private String endTime;
    private String time;
    private String month;
    private String day;

    public StdyTrckr(String writer, String startTime, String endTime, String month, String day) {
        this.writer = writer;
        this.startTime = startTime;
        this.endTime = endTime;
        this.month = month;
        this.day = day;
    }
}
