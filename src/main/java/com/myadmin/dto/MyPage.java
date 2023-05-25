package com.myadmin.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class MyPage {
    private String id;
    private String mbti;
    private String comdate;
    private String digidate;
    private String rdate;
    private String detail;
    private String insta;
    private String facebook;
}
