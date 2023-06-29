package com.myadmin.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.myadmin.dto.Stdn;
import com.myadmin.dto.StdnSearch;
import com.myadmin.frame.MyAdminService;
import com.myadmin.mapper.StdnMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class StdnService implements MyAdminService<String, Stdn> {

    @Autowired
    StdnMapper mapper;

    @Override
    public void register(Stdn stdn) throws Exception {
        mapper.insert(stdn);
    }

    @Override
    public void remove(String s) throws Exception {
        mapper.delete(s);
    }

    @Override
    public void modify(Stdn stdn) throws Exception {
        mapper.update(stdn);
    }

    @Override
    public Stdn get(String s) throws Exception {
        return mapper.select(s);
    }

    @Override
    public List<Stdn> get() throws Exception {
        return mapper.selectall();
    }

    public Page<Stdn> getPage(int pageNo) throws Exception {
        PageHelper.startPage(pageNo, 5);
        return mapper.getpage();
    }
    public Page<Stdn> searchpage(int pageNo, StdnSearch stdnSearch) throws Exception {
        PageHelper.startPage(pageNo, 5);
        return mapper.searchpage(stdnSearch);
    }

    public Page<Stdn> approve(String isJoin, int pageNo) throws Exception {
        PageHelper.startPage(pageNo, 5);
        return mapper.approve(isJoin);
    }

    public Page<Stdn> approvesearch(String isJoin, int pageNo, StdnSearch stdnSearch) throws Exception {
        PageHelper.startPage(pageNo, 5);
        return mapper.approvesearch(isJoin, stdnSearch);
    }

    public void joinupdate(String id) throws Exception {
        mapper.joinupdate(id);
    }

    public List<Stdn> totalattd() throws Exception {
        return mapper.totalattd();
    }

    public Page<Stdn> absent(int pageNo) throws Exception {
        PageHelper.startPage(pageNo, 5);
        return mapper.absent();
    }

    public Stdn topstdn() throws Exception{
        return mapper.topstdn();
    }
    public List<Stdn> topfront() throws Exception{
        return mapper.topfront();
    }
    public List<Stdn> topback() throws Exception{
        return mapper.topback();
    }

    public List<Stdn> topsbj() throws Exception{
        return mapper.topsbj();
    }

    public List<Stdn> latestdn() throws Exception{
        return mapper.latestdn();
    }
}
