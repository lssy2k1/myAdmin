package com.myadmin.mapper;

import com.myadmin.dto.MyPage;
import com.myadmin.dto.Stdn;
import com.myadmin.frame.MyAdminMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MyPageMapper extends MyAdminMapper<String, MyPage> {
}
