package com.myadmin.util;

import lombok.extern.slf4j.Slf4j;
import org.json.simple.parser.ParseException;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.IOException;
import java.util.Map;

@SpringBootTest
@Slf4j
public class WeatherUtilTest {

    @Test
    void WeatherTest() throws IOException, ParseException {
        String result = WeatherUtil.getWeather();
        Map<String, String> data = WeatherUtil.getData(result);
        log.info(data.get("rain"));//0없음, 1비, 2비또는눈, 3눈, 5빗방울, 6,7눈
        log.info(data.get("humi"));//습도
        log.info(data.get("temper"));//기온
        //기온, 습도는 출력, 위치는 성수동2가
        //부등호로 각기 다른 이미지 출력
        //date, time 만드는 함수, setInterval로 주기적으로 업데이트
    }
}
