package com.myadmin.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.myadmin.dto.Ord;
import com.myadmin.dto.OrdDetail;
import com.myadmin.frame.MyAdminService;
import com.myadmin.mapper.OrdDetailMapper;
import com.myadmin.mapper.OrdMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class OrdDetailService implements MyAdminService<Integer, OrdDetail> {

    @Autowired
    OrdDetailMapper mapper;

    public OrdDetailService(OrdDetailMapper mapper) {
        this.mapper = mapper;
    }


    @Override
    public void register(OrdDetail ordDetail) throws Exception {
        mapper.insert(ordDetail);
    }

    @Override
    public void remove(Integer integer) throws Exception {
        mapper.delete(integer);
    }

    @Override
    public void modify(OrdDetail ordDetail) throws Exception {
        mapper.update(ordDetail);
    }

    @Override
    public OrdDetail get(Integer integer) throws Exception {
        return mapper.select(integer);
    }

    @Override
    public List<OrdDetail> get() throws Exception {
        return mapper.selectall();
    }

    public Page<OrdDetail> getPage(int pageNo) throws Exception{
        PageHelper.startPage(pageNo, 10);
        return mapper.getpage();
    }

    public List<OrdDetail> searchOrd(Integer ordId) throws Exception{
        return mapper.searchord(ordId);
    }

}
