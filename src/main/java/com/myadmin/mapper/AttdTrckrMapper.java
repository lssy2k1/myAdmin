package com.myadmin.mapper;

import com.myadmin.dto.Attd;
import com.myadmin.dto.AttdTrckr;
import com.myadmin.frame.MyAdminMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface AttdTrckrMapper {
    public List<Attd> trckattd(AttdTrckr attdTrckr);
}
