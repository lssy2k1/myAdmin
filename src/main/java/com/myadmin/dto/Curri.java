package com.myadmin.dto;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Curri {
    private Integer id;
    private String stdnId;
    private String lecId;
    private String rdate;
    private String isOpen;
}
