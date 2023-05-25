package com.myadmin.dto;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Prz {
    private Integer id;
    private String stdnId;
    private String prz;
    private String przCategory;
    private String rdate;
}
