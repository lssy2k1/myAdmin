package com.myadmin.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class LecCategory {
    private Integer lecCode;
    private Integer sbjCode;
    private Integer sbjCode2;
    private Integer sbjCode3;
}
