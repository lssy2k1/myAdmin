package com.myadmin.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.myadmin.dto.Curri;
import com.myadmin.dto.Ord;
import com.myadmin.frame.MyAdminService;
import com.myadmin.mapper.CurriMapper;
import com.myadmin.mapper.OrdMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class OrdService implements MyAdminService<Integer, Ord> {

    @Autowired
    OrdMapper mapper;

    public OrdService(OrdMapper mapper) {
        this.mapper = mapper;
    }


    @Override
    public void register(Ord ord) throws Exception {
        mapper.insert(ord);
    }

    @Override
    public void remove(Integer integer) throws Exception {
        mapper.delete(integer);
    }

    @Override
    public void modify(Ord ord) throws Exception {
        mapper.update(ord);
    }

    @Override
    public Ord get(Integer integer) throws Exception {
        return mapper.select(integer);
    }

    @Override
    public List<Ord> get() throws Exception {
        return mapper.selectall();
    }

    public Page<Ord> getPage(int pageNo) throws Exception{
        PageHelper.startPage(pageNo, 10);
        return mapper.getpage();
    }
}
