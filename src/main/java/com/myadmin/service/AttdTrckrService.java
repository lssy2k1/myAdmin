package com.myadmin.service;

import com.myadmin.dto.Attd;
import com.myadmin.dto.AttdTrckr;
import com.myadmin.frame.MyAdminService;
import com.myadmin.mapper.AttdTrckrMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@Slf4j
public class AttdTrckrService implements MyAdminService<String, AttdTrckr> {
    @Autowired
    AttdTrckrMapper mapper;
    @Override
    public void register(AttdTrckr attdTrckr) throws Exception {

    }

    @Override
    public void remove(String s) throws Exception {

    }

    @Override
    public void modify(AttdTrckr attdTrckr) throws Exception {

    }

    @Override
    public AttdTrckr get(String s) throws Exception {
        return null;
    }

    @Override
    public List<AttdTrckr> get() throws Exception {
        return null;
    }

    public List<AttdTrckr> trckattd(String s) throws Exception{
        return mapper.trckattd(s);
    }
}
