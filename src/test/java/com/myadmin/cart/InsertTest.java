package com.myadmin.cart;

import com.myadmin.dto.Cart;
import com.myadmin.dto.Ord;
import com.myadmin.service.CartService;
import com.myadmin.service.OrdService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class InsertTest {

    @Autowired
    CartService cartService;

    @Test
    void contextLoads() {
        Cart cart = new Cart("admin2", "107", 1, null);

        try {
            cartService.register(cart);
            log.info(cartService.get().toString());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
