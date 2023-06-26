package com.myadmin.dto;


import lombok.*;

import java.io.Serializable;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class UserSession implements Serializable {
    private String userId;
    private String token;

}