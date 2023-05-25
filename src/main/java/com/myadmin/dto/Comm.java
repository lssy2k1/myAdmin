package com.myadmin.dto;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Comm {
    private Integer id;
    private Integer postId;
    private String contents;
    private String rdate;
    private String stdnId;
}
