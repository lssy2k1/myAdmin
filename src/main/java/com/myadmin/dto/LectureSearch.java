package com.myadmin.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class LectureSearch {
    private String title;
    private String teacher;
    private String topic;
    private Integer rating;
    private Integer lowerPrice;
    private Integer upperPrice;

}
