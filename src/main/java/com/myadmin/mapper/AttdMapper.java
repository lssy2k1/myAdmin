package com.myadmin.mapper;

import com.myadmin.dto.Attd;
import com.myadmin.frame.MyAdminMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface AttdMapper extends MyAdminMapper<String, Attd> {
}
