package com.myadmin.dto;

import lombok.*;

import java.io.Serializable;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString

public class Msg implements Serializable {
    private String sendid;
    private String receiveid;
    private String content1;
}
