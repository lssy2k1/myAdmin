package com.myadmin.mapper;

import com.myadmin.dto.LecCategory;
import com.myadmin.dto.SbjDetail;
import com.myadmin.frame.MyAdminMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface LecCategoryMapper extends MyAdminMapper<Integer, LecCategory> {
}
