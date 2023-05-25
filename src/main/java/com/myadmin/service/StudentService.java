package com.myadmin.service;

import com.myadmin.dto.Lecture;
import com.myadmin.dto.Stdn;
import com.myadmin.frame.MyAdminService;
import com.myadmin.mapper.StudentMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class StudentService implements MyAdminService<String, Stdn> {

    @Autowired
    StudentMapper mapper;

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
}
