package com.myadmin.mapper;

import com.github.pagehelper.Page;
import com.myadmin.dto.Ord;
import com.myadmin.dto.OrdDetail;
import com.myadmin.frame.MyAdminMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface OrdDetailMapper extends MyAdminMapper<Integer, OrdDetail> {

    public Page<OrdDetail> getpage() throws Exception;
    public List<OrdDetail> searchord(Integer ordid);

}
