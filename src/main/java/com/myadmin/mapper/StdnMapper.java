package com.myadmin.mapper;

import ch.qos.logback.core.encoder.EchoEncoder;
import com.github.pagehelper.Page;
import com.myadmin.dto.Stdn;
import com.myadmin.dto.StdnSearch;
import com.myadmin.frame.MyAdminMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface StdnMapper extends MyAdminMapper<String, Stdn> {
    Page<Stdn> getpage() throws Exception;
    Page<Stdn> searchpage(StdnSearch stdnSearch) throws Exception;
    Page<Stdn> approve(String isJoin) throws Exception;
    Page<Stdn> approvesearch(String isJoin, StdnSearch stdnSearch) throws Exception;
    void joinupdate(String id) throws Exception;
    List<Stdn> totalattd() throws Exception;
    Page<Stdn> absent() throws Exception;

}
