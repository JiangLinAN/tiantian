package com.nore.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nore.pojo.Good;
import com.nore.pojo.GoodType;
import com.nore.service.GoodService;
import com.nore.service.GoodTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author:nore
 */
@RequestMapping("/index")
@Controller
public class GoodTypeController {
    @Autowired
    private GoodTypeService goodTypeService;
    @Autowired
    private GoodService goodService;

    /**
     * todo:将商品类别名称及小图(simg)的数据转发到goodType,方便主页load
     *
     * @return
     */
    @RequestMapping("/typePage")
    public String indexTypePage(HttpServletRequest request) {
        List<GoodType> types = goodTypeService.findAllGoodType();
        request.setAttribute("types", types);
        return "goodType";
    }


    @RequestMapping("/typeGoods")
    public String typeGoods(Integer typeId, HttpServletRequest request) {
        //根据商品类别  id 查出 类别信息及商品信息
        GoodType goodTypeAndGoods = goodTypeService.findGoodsOrderBy(typeId);
        request.setAttribute("typeAndGoods",goodTypeAndGoods);
        return "typeGoods";
    }

    @RequestMapping("/orderTime")
    public String allGoods(Integer typeId, Integer pageNum,HttpServletRequest request) {
        if (pageNum<1){
            pageNum=1;
        }
        PageHelper.startPage(pageNum, 6);
        PageHelper.orderBy("t_goods.time");
        List<Good> goods = goodService.fingAllGoodBytypeId(typeId);
        PageInfo<Good> goodPageInfo=new PageInfo<>(goods);
        request.setAttribute("pageInfo", goodPageInfo);
        GoodType goodType = goodTypeService.findGoodsOrderBy(typeId);
        request.setAttribute("goodType",goodType);
        return "list";
    }
    @RequestMapping("/orderPrice")
    public String orderPrice(Integer typeId, Integer pageNum ,HttpServletRequest request) {
        if (pageNum<1){
            pageNum=1;
        }
        PageHelper.startPage(pageNum, 6);
        PageHelper.orderBy("t_goods.price");
        List<Good> goods = goodService.fingAllGoodBytypeId(typeId);
        PageInfo<Good> goodPageInfo=new PageInfo<>(goods);
        request.setAttribute("pageInfo", goodPageInfo);
        GoodType goodType = goodTypeService.findGoodsOrderBy(typeId);
        request.setAttribute("goodType",goodType);
        return "list";
    }

    @RequestMapping("/detail")
    public String goodDetail(Integer goodId,HttpServletRequest request){
        Good good=goodService.findGoodById(goodId);
        request.setAttribute("good",good);
        return "detail";
    }
}
