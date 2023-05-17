package com.myadmin.mapper;

import com.myadmin.dto.Marker;
import com.myadmin.dto.MarkerSearch;
import com.myadmin.frame.MyAdminMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface MarkerMapper extends MyAdminMapper<Integer, Marker> {
    public List<Marker> search(MarkerSearch ms);
}
