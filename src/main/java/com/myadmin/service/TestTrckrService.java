package com.myadmin.service;

import com.myadmin.dto.TestTrckr;
import com.myadmin.frame.MyAdminService;
import com.myadmin.mapper.TestTrckrMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class TestTrckrService implements MyAdminService<String, TestTrckr> {

    @Autowired
    TestTrckrMapper mapper;

    @Override
    public void register(TestTrckr testTrckr) throws Exception {

    }

    @Override
    public void remove(String s) throws Exception {

    }

    @Override
    public void modify(TestTrckr testTrckr) throws Exception {

    }

    @Override
    public TestTrckr get(String s) throws Exception {
        return null;
    }

    @Override
    public List<TestTrckr> get() throws Exception {
        return null;
    }

    public List<TestTrckr> trcktest(String s) throws Exception {
        return mapper.trcktest(s);
    }
}
