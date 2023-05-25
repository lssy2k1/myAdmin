package com.myadmin.service;

import com.myadmin.dto.Mrk;
import com.myadmin.dto.MrkSearch;
import com.myadmin.frame.MyAdminService;
import com.myadmin.mapper.MarkerMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class MarkerService implements MyAdminService<Integer, Mrk> {
    @Autowired
    MarkerMapper mapper;

    @Override
    public void register(Mrk marker) throws Exception {
        mapper.insert(marker);
    }

    @Override
    public void remove(Integer integer) throws Exception {
        mapper.delete(integer);
    }

    @Override
    public void modify(Mrk marker) throws Exception {
        mapper.update(marker);
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
