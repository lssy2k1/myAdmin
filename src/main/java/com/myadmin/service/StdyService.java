package com.myadmin.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.myadmin.dto.Stdn;
import com.myadmin.dto.Stdy;
import com.myadmin.dto.StdyTrckr;
import com.myadmin.frame.MyAdminService;
import com.myadmin.mapper.StdyMapper;
import com.myadmin.mapper.StdyTrckrMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class StdyService implements MyAdminService<String, Stdy> {

    @Autowired
    StdyMapper mapper;


    @Override
    public void register(Stdy stdy) throws Exception {

    }

    @Override
    public void remove(String s) throws Exception {

    }

    @Override
    public void modify(Stdy stdy) throws Exception {

    }

    @Override
    public Stdy get(String s) throws Exception {
        return null;
    }

    @Override
    public List<Stdy> get() throws Exception {
        return null;
    }

    public List<Stdy> stdying() throws Exception{
        return mapper.stdying();
    }

    public Page<Stdy> stdypage(int pageNo) throws Exception {
        PageHelper.startPage(pageNo, 10);
        return mapper.stdypage();
    }
}
