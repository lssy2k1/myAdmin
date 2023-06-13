package com.myadmin.mapper;

import com.github.pagehelper.Page;
import com.myadmin.dto.Stdn;
import com.myadmin.dto.StdnSearch;
import com.myadmin.frame.MyAdminMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface StdnMapper extends MyAdminMapper<String, Stdn> {
    Page<Stdn> getpage() throws Exception;
    Page<Stdn> searchpage(StdnSearch stdnSearch) throws Exception;
}
