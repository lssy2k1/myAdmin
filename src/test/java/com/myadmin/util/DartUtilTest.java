package com.myadmin.util;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class DartUtilTest {

    @Test
    void Dart(){
        DartUtil dartUtil = new DartUtil();
        dartUtil.getData("00126380", "2018", "11011");
    }
}
