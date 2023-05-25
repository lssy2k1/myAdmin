package com.myadmin.dto;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Ord {
    private Integer id;
    private String stdnId;
    private String rdate;
    private String isDone;
    private Integer ordPrice;
    private String payMethod;
    private String upDate;
    private Integer useCpn;
}
