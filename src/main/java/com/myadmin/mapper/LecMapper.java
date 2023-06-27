package com.myadmin.mapper;


import com.github.pagehelper.Page;
import com.myadmin.dto.Lec;
import com.myadmin.dto.LecSearch;
import com.myadmin.frame.MyAdminMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface LecMapper extends MyAdminMapper<Integer, Lec> {

    public Page<Lec> getpage();
    public Page<Lec> search(LecSearch ls);
    public List<Lec> hotlec();
    public List<Lec> hotlechit();
    public List<Lec> hotlecrating();
    public List<Lec> recentlec();
}
