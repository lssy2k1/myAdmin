package com.myadmin.service;

import com.myadmin.dto.Lec;
import com.myadmin.dto.LecSearch;
import com.myadmin.frame.MyAdminService;
import com.myadmin.mapper.LectureMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class LectureService implements MyAdminService<Integer, Lec> {
    @Autowired
    LectureMapper mapper;

    public LectureService(LectureMapper mapper) {
        this.mapper = mapper;
    }

    @Override
    public void register(Lec lecture) throws Exception {
        mapper.insert(lecture);
    }

    @Override
    public void remove(Integer integer) throws Exception {
        mapper.delete(integer);
    }

    @Override
    public void modify(Lec lecture) throws Exception {
        mapper.update(lecture);
    }

    @Override
    public Lec get(Integer integer) throws Exception {
        return mapper.select(integer);
    }

    @Override
    public List<Lec> get() throws Exception {
        return mapper.selectall();
    }

    public List<Lec> search(LecSearch ls){
        return mapper.search(ls);
    }
}
