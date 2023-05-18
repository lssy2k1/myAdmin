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
public class Adm {
    @NotEmpty(message = "아이디는 필수항목입니다.")
    @Size(min=4, max=15, message = "ID는 최소 4글자, 최대 15글자입니다.")
    private String id;
    @NotEmpty(message = "비밀번호는 필수항목입니다.")
    @Size(min=4, max=15, message = "PWD는 최소 4글자, 최대 15글자입니다.")
    private String pwd;
    private Integer lev;

}
