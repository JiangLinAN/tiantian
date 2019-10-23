package com.nore.service;

import com.nore.pojo.GoodType;

import java.util.List;

public interface GoodTypeService {
    //类别及小图的查询
    List<GoodType> findAllGoodType();

    GoodType findGoodTypeAndGoods(Integer typeId);
}
