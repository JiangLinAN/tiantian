<%--
  Created by IntelliJ IDEA.
  User: NoRe
  Date: 2019/10/23
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>天天生鲜-商品详情</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">

</head>
<body>

<jsp:include page="indexTop.jsp"/>


<div class="breadcrumb">
    <a href="#">全部分类</a>
    <span>></span>
    <a href="#">新鲜水果</a>
    <span>></span>
    <a href="#">商品详情</a>
</div>

<div class="goods_detail_con clearfix">
    <div class="goods_detail_pic fl"><img src="${pageContext.request.contextPath}/${requestScope.good.bimg}"></div>

    <div class="goods_detail_list fr">
        <h3>${requestScope.good.goodName}</h3>
        <p>${requestScope.good.mark}</p>
        <div class="prize_bar">
            <span class="show_pirze">¥<em>${requestScope.good.price}</em></span>
            <span class="show_unit">单  位：500g
            &nbsp;&nbsp;&nbsp;
            <fmt:formatDate value="${requestScope.good.time}" pattern="yyyy-MM-dd"/>
            </span>
        </div>
        <div class="goods_num clearfix">
            <div class="num_name fl">数 量：</div>
            <div class="num_add fl">
                <input id="counts" type="text" class="num_show fl" value="1">
                <a onclick="jia()" href="javascript:void(0);" class="add fr">加</a>
                <a onclick="jian()" href="javascript:void(0);" class="minus fr">减</a>
            </div>
        </div>
        <div class="total">总价：<em id="zprice">${requestScope.good.price}元</em></div>
        <div class="operate_btn">
            <a href="javascript:;" class="buy_btn">立即购买</a>
            <a href="javascript:;" class="add_cart" id="add_cart">加入购物车</a>
        </div>
    </div>
</div>
<script>
    function jia() {
        var jc=Number($("#counts").val())+1;
        $("#counts").attr("value",jc)
        zprice(jc)
    }
    function jian() {
        var c=Number($("#counts").val())-1;
        if (c<1){
            return false;
        }else {
            $("#counts").attr("value",c)
            zprice(c)
        }
    }
    function zprice(num) {
        var zp=${requestScope.good.price}*num;
        $("#zprice").html(zp+"元")
    }
</script>
<div class="main_wrap clearfix">
    <div class="l_wrap fl clearfix">
        <div class="new_goods">
            <h3>新品推荐</h3>
            <ul>
                <li>
                    <a href="#"><img src="images/goods/goods001.jpg"></a>
                    <h4><a href="#">进口柠檬</a></h4>
                    <div class="prize">￥3.90</div>
                </li>
                <li>
                    <a href="#"><img src="images/goods/goods002.jpg"></a>
                    <h4><a href="#">玫瑰香葡萄</a></h4>
                    <div class="prize">￥16.80</div>
                </li>
            </ul>
        </div>
    </div>

    <div class="r_wrap fr clearfix">
        <ul class="detail_tab clearfix">
            <li class="active">商品介绍</li>
            <li>评论</li>
        </ul>

        <div class="tab_content">
            <dl>
                <dt>商品详情：</dt>
                <dd>${requestScope.good.mark}
            </dl>
        </div>

    </div>

</div>

<jsp:include page="indexLow.jsp"/>
<div class="add_jump"></div>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.12.2.js"></script>
<script type="text/javascript">
    var $add_x = $('#add_cart').offset().top;
    var $add_y = $('#add_cart').offset().left;

    var $to_x = $('#show_count').offset().top;
    var $to_y = $('#show_count').offset().left;

    $(".add_jump").css({'left':$add_y+80,'top':$add_x+10,'display':'block'})
    $('#add_cart').click(function(){
        $(".add_jump").stop().animate({
                'left': $to_y+7,
                'top': $to_x+7},
            "fast", function() {
                $(".add_jump").fadeOut('fast',function(){
                    $('#show_count').html(2);
                });

            });
    })
</script>

</body>
</html>
