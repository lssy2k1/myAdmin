package com.myadmin.mapper;

import com.myadmin.dto.AttdTrckr;
import com.myadmin.dto.Test;
import com.myadmin.dto.TestTrckr;
import com.myadmin.frame.MyAdminMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface TestTrckrMapper {
    public List<TestTrckr> trcktest(String s);
}
