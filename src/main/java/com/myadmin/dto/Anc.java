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
    @NotEmpty(message = "TITLE은 필수항목입니다.")
    private String title;
    @NotEmpty(message = "WRITER은 필수항목입니다. 세션이 만료되었으니 다시 로그인 하세요")
    private String writer;
    @NotEmpty(message = "CONTENTS는 필수항목입니다.")
    private String contents;
    private String rdate;
    private String img;

    public Anc(int id, String title, String writer, String contents, String rdate, String img) {
        this.id = id;
        this.title = title;
        this.writer = writer;
        this.contents = contents;
        this.rdate = rdate;
        this.img = img;
    }

    private MultipartFile imgfile;
}
