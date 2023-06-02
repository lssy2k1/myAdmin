package com.myadmin.mapper;

import com.github.pagehelper.Page;
import com.myadmin.dto.Anc;
import com.myadmin.dto.Ord;
import com.myadmin.dto.OrdDetail;
import com.myadmin.frame.MyAdminMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface OrdMapper extends MyAdminMapper<Integer, Ord> {
    public Page<Ord> getpage() throws Exception;
    public List<Ord> searchorddetail(Integer orddetailid);

}
