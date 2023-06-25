package com.myadmin.mapper;

import com.github.pagehelper.Page;
import com.myadmin.dto.Cpn;
import com.myadmin.dto.Stdn;
import com.myadmin.dto.StdnSearch;
import com.myadmin.frame.MyAdminMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface CpnMapper extends MyAdminMapper<Integer, Cpn> {

}
