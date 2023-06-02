package com.myadmin.cart;

import com.myadmin.service.CartService;
import com.myadmin.service.OrdService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class SelectAllTest {

    @Autowired
    CartService cartService;

    @Test
    void contextLoads() {
        try {
            log.info(cartService.get().toString());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
