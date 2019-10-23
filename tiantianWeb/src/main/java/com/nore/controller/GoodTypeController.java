package com.nore.controller;

import com.nore.pojo.GoodType;
import com.nore.service.GoodTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @Author:nore
 */
@RequestMapping("/index")
@Controller
public class GoodTypeController {
    @Autowired
    private GoodTypeService goodTypeService;

    /**
     * todo:将商品类别名称及小图(simg)的数据转发到goodType,方便主页load
     * @return
     */
    @RequestMapping("/typePage")
    public String indexTypePage(HttpServletRequest request){
        List<GoodType> types = goodTypeService.findAllGoodType();
        request.getSession().setAttribute("types",types);
        return "goodType";
    }


    @RequestMapping("/typeGoods")
    public String typeGoods(Integer typeId, HttpServletRequest request){
        //根据商品类别  id 查出 类别信息及商品信息
        GoodType goodTypeAndGoods = goodTypeService.findGoodTypeAndGoods(typeId);
        request.setAttribute("type",goodTypeAndGoods);
        return "typeGoods";
    }
}
