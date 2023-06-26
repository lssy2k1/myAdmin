package com.myadmin.dto;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Cpn {
    private Integer id;
    private Integer specId;
    private String stdnId;
    private String giveDate;
    private String validDate;
    private String isUsed;

    public Cpn(Integer specId, String stdnId, String validDate) {
        this.specId = specId;
        this.stdnId = stdnId;
        this.validDate = validDate;
    }
}
