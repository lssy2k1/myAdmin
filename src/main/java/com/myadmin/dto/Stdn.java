package com.myadmin.dto;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Stdn {
//    @Size(min=4, max=15, message = "ID는 최소 4글자, 최대 15글자입니다.")
//    @NotEmpty(message = "아이디는 필수항목입니다.")
    private String id;
//    @Size(min=4, max=15, message = "PWD는 최소 4글자, 최대 15글자입니다.")
//    @NotEmpty(message = "비밀번호는 필수항목입니다.")
    private String pwd;
//    @NotEmpty(message = "이름은 필수항목입니다.")
    private String name;
    private String email;
    private String contact;
    private String img;
    private String birthday;
    private String isSubsc;
    private String cpn;
    private String isExit;
    private String exitDate;
    private String lastVisit;
    private String isJoin;
    private String sbj1;
    private String sbj2;
    private String sbj3;
    private String loginError;
}
