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
//    0 : 미구독, 1 : 구독
    private String cpn;
    private String isExit;
//    0 미탈퇴, 1 탈퇴
    private String exitDate;
    private String lastVisit;
    private String isJoin;
//    0 미승인, 1 승인, 2 오류초과, 3 차단
    private String sbj1;
    private String sbj2;
    private String sbj3;
    private String loginError;
//    5회 차단
    private String isAttend;
//    0 결석, 1 출석, 2 지각
    private String attdDate;

//    public Stdn(String id, String pwd, String name, String isSubsc, String isExit, String isJoin) {
//        this.id = id;
//        this.pwd = pwd;
//        this.name = name;
//        this.isSubsc = isSubsc;
//        this.isExit = isExit;
//        this.isJoin = isJoin;
//    }

    public Stdn(String id, String pwd, String name, String email, String contact, String isJoin) {
        this.id = id;
        this.pwd = pwd;
        this.name = name;
        this.email = email;
        this.contact = contact;
        this.isJoin = isJoin;
    }

    private String topScore;
    private String topStdy;
    private String topAttd;
    private String topLec;

}
