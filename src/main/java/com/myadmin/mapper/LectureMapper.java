package com.myadmin.mapper;

import com.myadmin.dto.Lecture;
import com.myadmin.dto.LectureSearch;
import com.myadmin.frame.MyAdminMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface LectureMapper extends MyAdminMapper<Integer, Lecture> {

    public List<Lecture> search(LectureSearch ls);
}
