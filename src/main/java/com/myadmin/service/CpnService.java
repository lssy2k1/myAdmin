package com.myadmin.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.myadmin.dto.Cpn;
import com.myadmin.dto.Stdn;
import com.myadmin.dto.StdnSearch;
import com.myadmin.frame.MyAdminService;
import com.myadmin.mapper.CpnMapper;
import com.myadmin.mapper.StdnMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class CpnService implements MyAdminService<Integer, Cpn> {

    @Autowired
    CpnMapper mapper;

    @Override
    public void register(Cpn cpn) throws Exception {
        mapper.insert(cpn);
    }

    @Override
    public void remove(Integer integer) throws Exception {

    }

    @Override
    public void modify(Cpn cpn) throws Exception {

    }

    @Override
    public Cpn get(Integer integer) throws Exception {
        return null;
    }

    @Override
    public List<Cpn> get() throws Exception {
        return null;
    }
}
