package com.nore.dao;

import com.nore.pojo.Good;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Author:nore
 */
public interface GoodDAO {
    List<Good> findGoodsByTypeId(@Param("id") Integer id);
}
