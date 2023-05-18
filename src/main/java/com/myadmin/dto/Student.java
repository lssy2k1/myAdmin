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
public class Student {
    @Size(min=4, max=15, message = "ID는 최소 4글자, 최대 15글자입니다.")
    @NotEmpty(message = "아이디는 필수항목입니다.")
    private String id;
    @Size(min=4, max=15, message = "PWD는 최소 4글자, 최대 15글자입니다.")
    @NotEmpty(message = "비밀번호는 필수항목입니다.")
    private String pwd;
    @NotEmpty(message = "이름은 필수항목입니다.")
    private String name;
    private String detail;
    private String email;
    private String contact;
    private String img;

    private MultipartFile imgfile;
    private String insta;
    private String facebook;

    public Student(String id, String pwd, String name, String email, String contact) {
        this.id = id;
        this.pwd = pwd;
        this.name = name;
        this.email = email;
        this.contact = contact;
    }


}
