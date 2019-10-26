package com.nore.dao;

import com.nore.pojo.Good;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author:nore
 */
public interface GoodDAO {
    List<Good> findAllGoodsOrderBy(@Param("id") Integer id);

    List<Good> findAllGoods(Integer typeId);

    Good findGoodById(@Param("goodId") Integer goodId);
}
