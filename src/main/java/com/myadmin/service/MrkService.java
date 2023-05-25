package com.myadmin.service;

import com.myadmin.dto.Mrk;
import com.myadmin.dto.MrkSearch;
import com.myadmin.frame.MyAdminService;
import com.myadmin.mapper.MrkMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class MrkService implements MyAdminService<Integer, Mrk> {
    @Autowired
    MrkMapper mapper;

    @Override
    public void register(Mrk mrk) throws Exception {
        mapper.insert(mrk);
    }

    @Override
    public void remove(Integer integer) throws Exception {
        mapper.delete(integer);
    }

    @Override
    public void modify(Mrk mrk) throws Exception {
        mapper.update(mrk);
    }

    @Override
    public Mrk get(Integer integer) throws Exception {
        return mapper.select(integer);
    }

    @Override
    public List<Mrk> get() throws Exception {
        return mapper.selectall();
    }

    public List<Mrk> search(MrkSearch ms) throws Exception{
        return mapper.search(ms);
    }
}
