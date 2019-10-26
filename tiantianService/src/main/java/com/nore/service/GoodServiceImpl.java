package com.nore.service;

import com.nore.dao.GoodDAO;
import com.nore.pojo.Good;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author:nore
 */
@Service
public class GoodServiceImpl implements GoodService {
    @Autowired
    private GoodDAO goodDAO;
    @Override
    public List<Good> fingAllGoodBytypeId(Integer typeId) {
        return goodDAO.findAllGoods(typeId);
    }

    @Override
    public Good findGoodById(Integer goodId) {
        return goodDAO.findGoodById(goodId);
    }
}
