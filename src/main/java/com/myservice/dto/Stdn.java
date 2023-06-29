package com.myservice.dto;
import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Stdn implements Serializable {
    @Size(min=5, max=10, message="ID는 5자리 이상 10자리 이하입니다.")
    @NotEmpty(message="PASSWORD는 5이상 12자리 이하입니다.")
    private String id;
    @Size(min=5, max=12, message="PASSWORD는 5이상 12자리 이하입니다.")
    @NotEmpty(message="PASSWORD는 5이상 12자리 이하입니다.")
    private String pwd;
    @NotEmpty(message="이름을 입력하세요.")
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
    private String qr;


    private MultipartFile imgfile;

    //for Register
    public Stdn(String id, String pwd, String name, String email, String contact, String sbj1, String sbj2, String sbj3) {
        this.id = id;
        this.pwd = pwd;
        this.name = name;
        this.email = email;
        this.contact = contact;
        this.sbj1 = sbj1;
        this.sbj2 = sbj2;
        this.sbj3 = sbj3;
    }

    //for stdn Update
//    public Stdn(String id, String name, String email, String contact, String img, String birthday, String sbj1, String sbj2, String sbj3) {
//        this.id = id;
//        this.name = name;
//        this.email = email;
//        this.contact = contact;
//        this.img = img;
//        this.birthday = birthday;
//        this.sbj1 = sbj1;
//        this.sbj2 = sbj2;
//        this.sbj3 = sbj3;
//    }

    //for Pwd Update
    public Stdn(String id, String pwd) {
        this.id = id;
        this.pwd = pwd;
    }

    //for Adm Update
    public Stdn(String id, String name, String email, String contact, String img, String birthday, String isSubsc, String cpn, String isExit, String exitDate, String lastVisit, String isJoin, String sbj1, String sbj2, String sbj3, String loginError) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.contact = contact;
        this.img = img;
        this.birthday = birthday;
        this.isSubsc = isSubsc;
        this.cpn = cpn;
        this.isExit = isExit;
        this.exitDate = exitDate;
        this.lastVisit = lastVisit;
        this.isJoin = isJoin;
        this.sbj1 = sbj1;
        this.sbj2 = sbj2;
        this.sbj3 = sbj3;
        this.loginError = loginError;
    }

    public Stdn(String id, String email, String contact, String img, String sbj1, String sbj2, String sbj3) {
        this.id = id;
        this.email = email;
        this.contact = contact;
        this.img = img;
        this.sbj1 = sbj1;
        this.sbj2 = sbj2;
        this.sbj3 = sbj3;
    }
}
