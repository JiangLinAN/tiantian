package com.nore.service;

import com.nore.pojo.Good;

import java.util.List;

public interface GoodService {
    List<Good> fingAllGoodBytypeId(Integer typeId);

    Good findGoodById(Integer goodId);
}
