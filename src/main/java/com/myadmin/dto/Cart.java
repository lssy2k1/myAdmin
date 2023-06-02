package com.myadmin.dto;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
    private String stdnId;
    private String lecId;
    private Integer id;
    private String rdate;

    public Cart(String stdnId, String lecId, Integer id, String rdate) {
        this.stdnId = stdnId;
        this.lecId = lecId;
        this.id = id;
        this.rdate = rdate;
    }

    private String stdnName;
    private String lecTeacher;
    private String lecTitle;
    private Integer lecDiscRate;
    private String lecTopic;
    private Integer lecPrice;
    private String target;
    private String lecImg;
}
