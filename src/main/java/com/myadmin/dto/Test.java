package com.myadmin.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Test {
    private Integer id;
    private String studentId;
    private String rdate;
    private String target;
    private Integer score;
    private String subject;
}
