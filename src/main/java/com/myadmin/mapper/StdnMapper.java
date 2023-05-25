package com.myadmin.mapper;

import com.myadmin.dto.Stdn;
import com.myadmin.frame.MyAdminMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface StdnMapper extends MyAdminMapper<String, Stdn> {
}