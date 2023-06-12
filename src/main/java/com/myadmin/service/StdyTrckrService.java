package com.myadmin.service;

import com.myadmin.dto.StdyTrckr;
import com.myadmin.frame.MyAdminService;
import com.myadmin.mapper.StdyTrckrMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class StdyTrckrService implements MyAdminService<String, StdyTrckr> {

    @Autowired
    StdyTrckrMapper mapper;

    @Override
    public void register(StdyTrckr stdyTrckr) throws Exception {

    }

    @Override
    public void remove(String s) throws Exception {

    }

    @Override
    public void modify(StdyTrckr stdyTrckr) throws Exception {

    }

    @Override
    public StdyTrckr get(String s) throws Exception {
        return null;
    }

    @Override
    public List<StdyTrckr> get() throws Exception {
        return null;
    }

    public List<StdyTrckr> trckstdy(String s) throws Exception {
        return mapper.trckstdy(s);
    }
}
