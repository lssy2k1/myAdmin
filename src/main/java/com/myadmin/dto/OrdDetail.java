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
    private Integer discRate;
    private Integer price;

    public OrdDetail(Integer id, Integer lecId, Integer ordId, String stdyHour, Integer discRate, Integer price) {
        this.id = id;
        this.lecId = lecId;
        this.ordId = ordId;
        this.stdyHour = stdyHour;
        this.discRate = discRate;
        this.price = price;
    }

    //ord
    private String stdnId;
    //lec
    private Integer lecCode;
    private String lecTitle;
    private String lecTeacher;
    private String lecTopic;
    private String lecTarget;
    private String lecLength;
    private String img;

}
