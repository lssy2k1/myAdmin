package com.myadmin.leccategory;

import com.myadmin.dto.LecCategory;
import com.myadmin.dto.SbjDetail;
import com.myadmin.service.LecCategoryService;
import com.myadmin.service.SbjDetailService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class InsertTest {

    @Autowired
    LecCategoryService lecCategoryService;

    @Test
    void contextLoads() {
        try {
            LecCategory lecCategory = new LecCategory(0, 1, 12, 23);
            lecCategoryService.register(lecCategory);
            log.info(lecCategoryService.get().toString());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
