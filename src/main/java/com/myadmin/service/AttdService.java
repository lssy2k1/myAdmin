package com.myadmin.service;

import com.myadmin.dto.Attd;
import com.myadmin.frame.MyAdminService;
import com.myadmin.mapper.AttdMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class AttdService implements MyAdminService<String, Attd> {

    @Autowired
    AttdMapper mapper;


    @Override
    public void register(Attd attd) throws Exception {

    }

    @Override
    public void remove(String s) throws Exception {

    }

    @Override
    public void modify(Attd attd) throws Exception {

    }

    @Override
    public Attd get(String s) throws Exception {
        return mapper.select(s);
    }

    @Override
    public List<Attd> get() throws Exception {
        return null;
    }
}
