package com.myadmin.mapper;


import com.myadmin.dto.Lec;
import com.myadmin.dto.LecSearch;
import com.myadmin.frame.MyAdminMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface LectureMapper extends MyAdminMapper<Integer, Lec> {

    public List<Lec> search(LecSearch ls);
}
