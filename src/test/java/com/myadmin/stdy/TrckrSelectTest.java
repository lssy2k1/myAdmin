package com.myadmin.stdy;

import com.myadmin.dto.AttdTrckr;
import com.myadmin.dto.StdyTrckr;
import com.myadmin.service.AttdTrckrService;
import com.myadmin.service.StdyTrckrService;
import com.myadmin.util.GetTimeUtil;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@SpringBootTest
class TrckrSelectTest {

    @Autowired
    StdyTrckrService stdyTrckrService;
    @Test
    void contextLoads() {
        ArrayList<StdyTrckr> data2 = new ArrayList<>();
        ArrayList<StdyTrckr> data3 = new ArrayList<>();
        ArrayList<StdyTrckr> data4 = new ArrayList<>();
        ArrayList<StdyTrckr> data5 = new ArrayList<>();
        ArrayList<StdyTrckr> data6 = new ArrayList<>();
        ArrayList<StdyTrckr> data7 = new ArrayList<>();
        try {
            List<StdyTrckr> stdyList = stdyTrckrService.trckstdy("katarina");
            for (StdyTrckr s:stdyList) {
                String timeStr1 = s.getStartTime();
                String timeStr2 = s.getEndTime();
                System.out.println("-----------------------------");
                System.out.println(timeStr1);
                System.out.println(timeStr2);
                System.out.println("-----------------------------");

                String timeDiff = GetTimeUtil.getTime(timeStr1, timeStr2);
                System.out.println("-----------------------------");
                System.out.println(timeDiff);
                s.setTime(timeDiff);

                if (s.getMonth().equals("02")) {
                    data2.add(s);
                } if (s.getMonth().equals("03")) {
                    data3.add(s);
                } if (s.getMonth().equals("04")) {
                    data4.add(s);
                } if (s.getMonth().equals("05")) {
                    data5.add(s);
                } if (s.getMonth().equals("06")) {
                    data6.add(s);
                } if (s.getMonth().equals("07")) {
                    data7.add(s);
                }
            }
            System.out.println(data2);
            System.out.println(data3);
            System.out.println(data4);
            System.out.println(data5);
            System.out.println(data6);
            System.out.println(data7);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
