package com.myadmin.service;

import com.myadmin.dto.SbjDetail;
import com.myadmin.frame.MyAdminService;
import com.myadmin.mapper.SbjDetailMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class SbjDetailService implements MyAdminService<Integer, SbjDetail> {

    @Autowired
    SbjDetailMapper mapper;

    public SbjDetailService(SbjDetailMapper mapper) {
        this.mapper = mapper;
    }


    @Override
    public void register(SbjDetail sbjDetail) throws Exception {
        mapper.insert(sbjDetail);
    }

    @Override
    public void remove(Integer integer) throws Exception {
        mapper.delete(integer);
    }

    @Override
    public void modify(SbjDetail sbjDetail) throws Exception {
        mapper.update(sbjDetail);
    }

    @Override
    public SbjDetail get(Integer integer) throws Exception {
        return mapper.select(integer);
    }

    @Override
    public List<SbjDetail> get() throws Exception {
        return mapper.selectall();
    }

    public List<SbjDetail> searchBig(){
        return mapper.searchbig();
    }
}
