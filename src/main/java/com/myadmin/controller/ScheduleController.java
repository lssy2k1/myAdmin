package com.myadmin.controller;

import com.myadmin.dto.Attd;
import com.myadmin.dto.Stdn;
import com.myadmin.service.AttdService;
import com.myadmin.service.StdnService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Slf4j
@Component
public class ScheduleController {
//    @Autowired
//    private SimpMessageSendingOperations messagingTemplate;
    @Autowired
    StdnService stdnService;
    @Autowired
    AttdService attdService;

    @Scheduled(cron = "1 0 9 * * *")
    public void cronJobLateUpdate() throws Exception {
        // 아침 9시
        List<Stdn> totalattd = stdnService.totalattd();
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
        String currentDate = dateFormat.format(date);
        Attd attd;
        for(Stdn s:totalattd) {
            if(s.getAttdDate() == null || (s.getAttdDate()).equals("") || !(s.getAttdDate()).equals(currentDate)){
                attd = new Attd(s.getId(), "2");
                attdService.register(attd);
            }
//            else {
//                attd = attdService.get(s.getId());
//                attd.setIsAttend("1");
//                attdService.modify(attd);
//            }
        }
        System.out.println("---------------지각 업데이트 완료---------------");
//        log.info("----------- Scheduler ------------");
//        Random r = new Random();
//        int content1 = r.nextInt(100) + 1;
//        int content2 = r.nextInt(1000) + 1;
//        int content3 = r.nextInt(500) + 1;
//        int content4 = r.nextInt(10) + 1;
//
//        MsgAdm msg = new MsgAdm();
//        msg.setContent1(content1);
//        msg.setContent2(content2);
//        msg.setContent3(content3);
//        msg.setContent4(content4);
//        messagingTemplate.convertAndSend("/sendadm",msg);
//        messagingTemplate.convertAndSend("/send", msg);
    }

    @Scheduled(cron = "1 0 18 * * *")
    public void cronJobAbsentUpdate() throws Exception {
        // 오후 6시
        // 위의 프로세스 반복
        // stdn.isAttend를 0(결석)으로 업데이트
        List<Stdn> totalattd = stdnService.totalattd();
        Attd attd;
        for (Stdn s : totalattd) {
            attd = attdService.get(s.getId());
            if (attd.getIsAttend().equals("2") && (attd.getStartTime() == null || attd.getStartTime().equals(""))) {
                    attd.setIsAttend("0");
                    attdService.modify(attd);
                }
            }
            System.out.println("---------------결석 업데이트 완료---------------");
        }



    @Scheduled(cron = "*/5 * * * * *")
    public void cronJobWeeklyUpdate() throws Exception {
//        List<Cart> cartList = cartService.get();
//        int sum = 0;
//        for(Cart obj: cartList){
//            sum += obj.getItem_price() * obj.getCnt();
//        }
//        log.info(sum+"");

//        카트기능 써머라이즈
//        mapper, service를 가져와야 함.
//        cart에 가격을 넣으면
//        int sum = cartService.getallprice();
//        log.info(sum +"");
    }


}