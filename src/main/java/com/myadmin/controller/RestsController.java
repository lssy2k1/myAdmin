package com.myadmin.controller;

import com.myadmin.util.GptUtil;
import org.json.simple.parser.ParseException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.net.URISyntaxException;

@RestController
public class RestsController {

    @RequestMapping("/giveid")
    public String giveid(Model model){
        String result = "";
        try {
            result = GptUtil.getResult("5-10글자 영문, 숫자 아이디를 하나만 만들려고 해. 추천해줘. " +
                    "답변은 글자만 출력해줘. 특수문자는 출력하지마. " +
                    "만약 같은 질문을 보내도 답변만 해");
        } catch(Exception e){
            result = "천천히 누르세요......";
        }
        return result;
    }

}
