package com.myadmin.leccategory;

import com.myadmin.service.LecCategoryService;
import com.myadmin.service.SbjDetailService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class DeleteTest {

    @Autowired
    LecCategoryService lecCategoryService;
    @Test
    void contextLoads() {
        try {
            lecCategoryService.remove(100);
            lecCategoryService.get();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
