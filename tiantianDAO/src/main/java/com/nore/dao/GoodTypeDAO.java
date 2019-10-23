package com.nore.dao;

import com.nore.pojo.GoodType;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GoodTypeDAO {
    //商品分类查询
    List<GoodType> findAllType();

    GoodType findTypeById(Integer typeId);
}
