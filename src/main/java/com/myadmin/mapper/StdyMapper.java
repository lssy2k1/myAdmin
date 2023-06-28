package com.myadmin.mapper;

import com.github.pagehelper.Page;
import com.myadmin.dto.Stdn;
import com.myadmin.dto.Stdy;
import com.myadmin.dto.StdyTrckr;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface StdyMapper {
    List<Stdy> stdying();
    Page<Stdy> stdypage();
}
