package com.nore.service;

import com.nore.dao.GoodDAO;
import com.nore.dao.GoodTypeDAO;
import com.nore.pojo.Good;
import com.nore.pojo.GoodType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author:nore
 */
@Service
public class GoodTypeServiceImpl implements GoodTypeService {

    @Autowired
    private GoodDAO goodDAO;
    @Autowired
    private GoodTypeDAO goodTypeDAO;
    @Override
    public List<GoodType> findAllGoodType() {
        return goodTypeDAO.findAllType();
    }

    @Override
    public GoodType findGoodTypeAndGoods(Integer typeId) {
        List<Good> goods = goodDAO.findGoodsByTypeId(typeId);
        GoodType goodType= goodTypeDAO.findTypeById(typeId);
        goodType.setGoods(goods);
        return goodType;
    }
}
