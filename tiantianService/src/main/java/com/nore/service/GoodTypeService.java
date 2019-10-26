package com.nore.service;

import com.nore.pojo.GoodType;

import java.util.List;

public interface GoodTypeService {
    //类别及小图的查询
    List<GoodType> findAllGoodType();
    //查询一个类别下的所有goods,并根据time排序
    GoodType findGoodsOrderBy(Integer id);

    GoodType findAllGoods(Integer typeId);
}
