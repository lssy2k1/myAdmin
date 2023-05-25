package com.myadmin.mapper;


import com.myadmin.dto.Mrk;
import com.myadmin.dto.MrkSearch;
import com.myadmin.frame.MyAdminMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface MrkMapper extends MyAdminMapper<Integer, Mrk> {
    public List<Mrk> search(MrkSearch ms);
}
