package com.myadmin.service;

import com.myadmin.dto.LecCategory;
import com.myadmin.frame.MyAdminService;
import com.myadmin.mapper.LecCategoryMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class LecCategoryService implements MyAdminService<Integer, LecCategory> {

    @Autowired
    LecCategoryMapper mapper;

    public LecCategoryService(LecCategoryMapper mapper) {
        this.mapper = mapper;
    }

    @Override
    public void register(LecCategory lecCategory) throws Exception {
        mapper.insert(lecCategory);
    }

    @Override
    public void remove(Integer integer) throws Exception {
        mapper.delete(integer);
    }

    @Override
    public void modify(LecCategory lecCategory) throws Exception {
        mapper.update(lecCategory);
    }

    @Override
    public LecCategory get(Integer integer) throws Exception {
        return mapper.select(integer);
    }

    @Override
    public List<LecCategory> get() throws Exception {
        return mapper.selectall();
    }
}
