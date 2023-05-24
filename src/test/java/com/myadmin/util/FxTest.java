package com.myadmin.util;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class FxTest {

    @Test
    void FxTest(){
        FxUtil fxUtil = new FxUtil();
        fxUtil.getData("20230518");
    }
}
