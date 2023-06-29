package com.myadmin.stdn;

import com.myadmin.dto.Stdn;
import com.myadmin.service.StdnService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@Slf4j
@SpringBootTest
public class TopStdnTest {

    @Autowired
    StdnService stdnService;

    @Test
    void test() throws Exception {
        List<Stdn> topfront = stdnService.topfront();
        Stdn highestFrontSumStdn = null;
        int highestFrontSum = 0;

        for (Stdn stdn : topfront) {
            int currentFrontSum = stdn.getFrontTestSum();
            if (currentFrontSum > highestFrontSum) {
                highestFrontSum = currentFrontSum;
                highestFrontSumStdn = stdn;
            }
        }
        log.info("highestFrontSumStdn ={}", highestFrontSumStdn);

        List<Stdn> topback = stdnService.topback();
        Stdn highestBackSumStdn = null;
        int highestBackSum = 0;

        for (Stdn stdn : topback) {
            int currentBackSum = stdn.getBackTestSum();
            if (currentBackSum > highestBackSum) {
                highestBackSum = currentBackSum;
                highestBackSumStdn = stdn;
            }
        }
        log.info("highestBackSumStdn ={}", highestBackSumStdn);
    }
}
