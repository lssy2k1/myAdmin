package com.myadmin.leccategory;

import com.myadmin.dto.Anc;
import com.myadmin.dto.LecCategory;
import com.myadmin.service.AncService;
import com.myadmin.service.LecCategoryService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class UpdateTest {

    @Autowired
    LecCategoryService lecCategoryService;
    @Test
    void contextLoads() {
        LecCategory lecCategory = new LecCategory(100, 2, 4, 6);

        try {
            lecCategoryService.modify(lecCategory);
            log.info(lecCategoryService.get().toString());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
