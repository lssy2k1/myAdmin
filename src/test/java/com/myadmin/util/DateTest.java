package com.myadmin.util;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Calendar;

@SpringBootTest
@Slf4j
public class DateTest {

    @Test
    void DateTest(){
        Calendar calendar = Calendar.getInstance();
        int year = calendar.get(calendar.YEAR);
        int month = calendar.get(calendar.MONTH) + 1;
        int day = calendar.get(calendar.DAY_OF_MONTH);
        int hour = calendar.get(calendar.HOUR_OF_DAY);
        String month_formatted = String.format("%02d", month);
        String hour_formatted = String.format("%02d", hour);
        String result = ""+year+month_formatted+day+hour_formatted+"00";
        log.info(result.substring(0,8));
        log.info(result.substring(8,12));
    }
}
