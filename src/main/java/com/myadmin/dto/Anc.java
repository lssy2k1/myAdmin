package com.myadmin.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Anc {
    private int id;
//    @NotEmpty(message = "제목은 필수항목입니다.")
    private String title;
//    @NotEmpty(message = "작성자는 필수항목입니다.")
    private String writer;
//    @NotEmpty(message = "내용은 필수항목입니다.")
    private String contents;
    private String img;
    private String rdate;

    private MultipartFile imgfile;

    public Anc(int id, String title, String writer, String contents, String img, String rdate) {
        this.id = id;
        this.title = title;
        this.writer = writer;
        this.contents = contents;
        this.img = img;
        this.rdate = rdate;
    }
}
