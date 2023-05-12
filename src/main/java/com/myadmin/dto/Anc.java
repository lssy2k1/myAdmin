package com.myadmin.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Anc {
    private int id;
    private String title;
    private String writer;
    private String contents;
    private String rdate;
    private String img;

}
