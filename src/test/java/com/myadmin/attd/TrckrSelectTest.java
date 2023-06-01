package com.myadmin.attd;

import com.myadmin.dto.Attd;
import com.myadmin.dto.AttdTrckr;
import com.myadmin.service.AttdService;
import com.myadmin.service.AttdTrckrService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@Slf4j
@SpringBootTest
class TrckrSelectTest {

    @Autowired
    AttdTrckrService attdTrckrService;
    @Test
    void contextLoads() {
        try {
            AttdTrckr attdTrckr = new AttdTrckr("katarina", "05", "01");
            List<Attd> attdList = attdTrckrService.trckAttd(attdTrckr);
            System.out.println(attdList);
            System.out.println(attdList.get(0));
            System.out.println(attdList.get(0).getIsAttend());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
