package com.myadmin.mapper;

import com.myadmin.dto.Attd;
import com.myadmin.dto.AttdTrckr;
import com.myadmin.frame.MyAdminMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface AttdTrckrMapper {
    public List<AttdTrckr> trckattd(String s);
}
