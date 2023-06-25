package com.myadmin.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.myadmin.dto.AttdAll;
import com.myadmin.dto.AttdTrckr;
import com.myadmin.dto.Stdn;
import com.myadmin.frame.MyAdminService;
import com.myadmin.mapper.AttdAllMapper;
import com.myadmin.mapper.AttdTrckrMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class AttdAllService implements MyAdminService<String, AttdAll> {
    @Autowired
    AttdAllMapper mapper;

    @Override
    public void register(AttdAll attdAll) throws Exception {

    }

    @Override
    public void remove(String s) throws Exception {

    }

    @Override
    public void modify(AttdAll attdAll) throws Exception {

    }

    @Override
    public AttdAll get(String s) throws Exception {
        return null;
    }

    @Override
    public List<AttdAll> get() throws Exception {
        return mapper.attdall();
    }

    public Page<AttdAll> attdall(int pageNo) throws Exception {
        PageHelper.startPage(pageNo, 10);
        return mapper.attdall();
    }
}
