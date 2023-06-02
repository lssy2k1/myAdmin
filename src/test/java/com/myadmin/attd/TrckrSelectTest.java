package com.myadmin.attd;

import com.myadmin.dto.Attd;
import com.myadmin.dto.AttdTrckr;
import com.myadmin.service.AttdService;
import com.myadmin.service.AttdTrckrService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.lang.reflect.Array;
import java.util.*;

@Slf4j
@SpringBootTest
class TrckrSelectTest {

    @Autowired
    AttdTrckrService attdTrckrService;
    @Test
    void contextLoads() {
        ArrayList<AttdTrckr> data2 = new ArrayList<>();
        ArrayList<AttdTrckr> data3 = new ArrayList<>();
        ArrayList<AttdTrckr> data4 = new ArrayList<>();
        ArrayList<AttdTrckr> data5 = new ArrayList<>();
        ArrayList<AttdTrckr> data6 = new ArrayList<>();
        ArrayList<AttdTrckr> data7 = new ArrayList<>();
        try {
            List<AttdTrckr> attdList = attdTrckrService.trckattd("katarina");
            for (AttdTrckr a:attdList) {
                System.out.println(a.getMonth());
                if (a.getMonth().equals("02")) {
                    data2.add(a);
                } if (a.getMonth().equals("03")) {
                    data3.add(a);
                } if (a.getMonth().equals("04")) {
                    data4.add(a);
                } if (a.getMonth().equals("05")) {
                    data5.add(a);
                } if (a.getMonth().equals("06")) {
                    data6.add(a);
                } if (a.getMonth().equals("07")) {
                    data7.add(a);
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
