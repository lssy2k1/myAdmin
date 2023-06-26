package com.myadmin.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.myadmin.dto.Lec;
import com.myadmin.dto.LecSearch;
import com.myadmin.frame.MyAdminService;
import com.myadmin.mapper.LecMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class LecService implements MyAdminService<Integer, Lec> {

    @Autowired
    LecMapper mapper;

    public LecService(LecMapper mapper) {
        this.mapper = mapper;
    }

    @Override
    public void register(Lec lec) throws Exception {
        mapper.insert(lec);
    }

    @Override
    public void remove(Integer integer) throws Exception {
        mapper.delete(integer);
    }

    @Override
    public void modify(Lec lec) throws Exception {
        mapper.update(lec);
    }

    @Override
    public Lec get(Integer integer) throws Exception {
        return mapper.select(integer);
    }

    @Override
    public List<Lec> get() throws Exception {
        return mapper.selectall();
    }

    public Page<Lec> getPage(int pageNo) throws Exception {
        PageHelper.startPage(pageNo, 10);
        return mapper.getpage();
    }

    public Page<Lec> search(int pageNo, LecSearch ls){
        PageHelper.startPage(pageNo, 10);
        return mapper.search(ls);
    }
    public List<Lec> hotlec(){
        return mapper.hotlec();
    }
    public List<Lec> hotlechit(){
        return mapper.hotlechit();
    }
    public List<Lec> hotlecrating(){
        return mapper.hotlecrating();
    }
    public List<Lec> recentlec(){
        return mapper.recentlec();
    }
}
