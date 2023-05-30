package com.myadmin.service;

import com.myadmin.dto.MyPage;
import com.myadmin.frame.MyAdminService;
import com.myadmin.mapper.MyPageMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class MyPageService implements MyAdminService<String, MyPage> {

    @Autowired
    MyPageMapper mapper;

    @Override
    public void register(MyPage myPage) throws Exception {
        mapper.insert(myPage);
    }

    @Override
    public void remove(String s) throws Exception {
        mapper.delete(s);
    }

    @Override
    public void modify(MyPage myPage) throws Exception {
        mapper.update(myPage);
    }

    @Override
    public MyPage get(String s) throws Exception {
        return mapper.select(s);
    }

    @Override
    public List<MyPage> get() throws Exception {
        return mapper.selectall();
    }
}
