package com.myadmin.mapper;

import com.myadmin.dto.StdyTrckr;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface StdyTrckrMapper {
    public List<StdyTrckr> trckstdy(String s);
}
