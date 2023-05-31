package com.myadmin.leccategory;

import com.myadmin.service.LecCategoryService;
import com.myadmin.service.SbjDetailService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class SelectTest {

    @Autowired
    LecCategoryService lecCategoryService;
    @Test
    void contextLoads() {
        try {
            log.info(lecCategoryService.get(100).toString());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
