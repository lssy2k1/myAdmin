package com.myadmin.mapper;

import com.github.pagehelper.Page;
import com.myadmin.dto.AttdAll;
import com.myadmin.dto.AttdTrckr;
import com.myadmin.dto.Stdn;
import com.myadmin.frame.MyAdminMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface AttdAllMapper extends MyAdminMapper<String, AttdAll> {
    Page<AttdAll> attdall() throws Exception;
}
