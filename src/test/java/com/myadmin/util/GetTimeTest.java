package com.myadmin.util;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.text.SimpleDateFormat;
import java.util.Date;

@SpringBootTest
public class GetTimeTest {

    @Test
    void GetTimeTest() {
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd hh:mm:ss");

            String timeStr1 = "2023.06.01 20:00:00";
            String timeStr2 = "2023.06.01 19:59:00";
            Date date1 = dateFormat.parse(timeStr1);
            Date date2 = dateFormat.parse(timeStr2);

            long timeMil1 = date1.getTime();
            long timeMil2 = date2.getTime();

            long diff = timeMil2 - timeMil1;

            long diffMin = diff / (1000 * 60);

            System.out.println(diffMin+"분");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    }
