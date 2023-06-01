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
    private String updDate;
    private Integer useCpn;

    public Ord(Integer id, String stdnId, String rdate, String isDone, Integer ordPrice, String payMethod, Integer useCpn) {
        this.id = id;
        this.stdnId = stdnId;
        this.rdate = rdate;
        this.isDone = isDone;
        this.ordPrice = ordPrice;
        this.payMethod = payMethod;
        this.useCpn = useCpn;
    }
}
