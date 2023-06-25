package com.myadmin.controller;

import com.myadmin.dto.Msg;
import com.myadmin.util.GptUtil;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.net.URISyntaxException;

@Controller
public class MsgController {
    @Autowired
    SimpMessagingTemplate template;

//    //redis 서버에 notification alarm 저장할 것
//    @Autowired
//    private RedisTemplate<String, String> redisTemplate;


    @MessageMapping("/receiveall") // 모두에게 전송
    public void receiveall(Msg msg, SimpMessageHeaderAccessor headerAccessor) {
        template.convertAndSend("/send",msg);
    }

    @MessageMapping("/receiveme") // 나에게만 전송 ex)Chatbot
    public void receiveme(Msg msg, SimpMessageHeaderAccessor headerAccessor) {
        String id = msg.getSendid();
        template.convertAndSend("/send/"+id,msg);
    }

    @MessageMapping("/receiveto") // 특정 Id에게 전송
    public void receiveto(Msg msg, SimpMessageHeaderAccessor headerAccessor) {
        String id = msg.getSendid();
        String target = msg.getReceiveid();
        template.convertAndSend("/send/to/"+target,msg);
    }

    @MessageMapping("/chatbotme") // 특정 Id에게 전송
    public void chatbotme(Msg msg, SimpMessageHeaderAccessor headerAccessor) throws IOException, URISyntaxException, ParseException, InterruptedException {
        String target = msg.getSendid();
        String txt = msg.getContent1();//채팅하자 라고 msg에 넣은 것을 꺼낼게
        String result = GptUtil.getResult(txt);//꺼낸걸 chatbot에 넣어서 답변을 받을게
        msg.setContent1(result);//결과를 메세지에 담아서 보낼게
        template.convertAndSend("/chsend/"+target,msg);
    }
}
