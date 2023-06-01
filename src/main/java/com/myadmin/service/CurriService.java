package com.myadmin.service;

import com.myadmin.dto.Cart;
import com.myadmin.dto.Curri;
import com.myadmin.frame.MyAdminService;
import com.myadmin.mapper.CartMapper;
import com.myadmin.mapper.CurriMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class CurriService implements MyAdminService<Integer, Curri> {

    @Autowired
    CurriMapper mapper;

    public CurriService(CurriMapper mapper) {
        this.mapper = mapper;
    }


    @Override
    public void register(Curri curri) throws Exception {
        mapper.insert(curri);
    }

    @Override
    public void remove(Integer integer) throws Exception {
        mapper.delete(integer);
    }

    @Override
    public void modify(Curri curri) throws Exception {
        mapper.update(curri);
    }

    @Override
    public Curri get(Integer integer) throws Exception {
        return mapper.select(integer);
    }

    @Override
    public List<Curri> get() throws Exception {
        return mapper.selectall();
    }
}
