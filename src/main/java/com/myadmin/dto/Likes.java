package com.myadmin.dto;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Likes {
    private Integer likeId;
    private Integer postId;
    private String stdnId;
    private String board;
}
