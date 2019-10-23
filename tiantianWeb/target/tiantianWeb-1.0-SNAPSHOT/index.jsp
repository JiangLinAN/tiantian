<%--
  Created by IntelliJ IDEA.
  User: NoRe
  Date: 2019/10/21
  Time: 19:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>天天生鲜-首页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="js/slide.js"></script>
</head>
<body>
<div class="header_con">
    <div class="header">
        <div class="welcome fl">欢迎来到天天生鲜!
            <shiro:user>
                <shiro:principal/>
            </shiro:user>
        </div>
        <div class="fr">

            <div class="login_btn fl">
                <shiro:guest>
                <a href="login.jsp">登录</a>
                <span>|</span>
                <a href="register.jsp">注册</a>
                </shiro:guest>
                <shiro:user>
                    <a href="${pageContext.request.contextPath}/user/logout">注销</a>
                </shiro:user>
            </div>


            <div class="user_link fl">
                <span>|</span>
                <a href="user_center_info.html">用户中心</a>
                <span>|</span>
                <a href="cart.html">我的购物车</a>
                <span>|</span>
                <a href="user_center_order.html">我的订单</a>
            </div>
        </div>
    </div>
</div>

<div class="search_bar clearfix">
    <a href="index.html" class="logo fl"><img src="images/logo.png"></a>
    <div class="search_con fl">
        <input type="text" class="input_text fl" name="" placeholder="搜索商品">
        <input type="button" class="input_btn fr" name="" value="搜索">
    </div>
    <div class="guest_cart fr">
        <a href="#" class="cart_name fl">我的购物车</a>
        <div class="goods_count fl" id="show_count">1</div>
    </div>
</div>

<div class="navbar_con">
    <div class="navbar">
        <h1 class="fl">全部商品分类</h1>
        <ul class="navlist fl">
            <li><a href="">首页</a></li>
            <li class="interval">|</li>
            <li><a href="">手机生鲜</a></li>
            <li class="interval">|</li>
            <li><a href="">抽奖</a></li>
        </ul>
    </div>
</div>

<div class="center_con clearfix">
    <div id="type01"></div>
    <script>
        $('#type01').load("${pageContext.request.contextPath}/index/typePage");
    </script>

    <div class="slide fl">
        <ul class="slide_pics">
            <li><img src="images/slide.jpg" alt="幻灯片"></li>
            <li><img src="images/slide02.jpg" alt="幻灯片"></li>
            <li><img src="images/slide03.jpg" alt="幻灯片"></li>
            <li><img src="images/slide04.jpg" alt="幻灯片"></li>
        </ul>
        <div class="prev"></div>
        <div class="next"></div>
        <ul class="points"></ul>
    </div>
    <div class="adv fl">
        <a href="#"><img src="images/adv01.jpg"></a>
        <a href="#"><img src="images/adv02.jpg"></a>
    </div>
</div>
<div id="typeGoods01"></div>
<div id="typeGoods02"></div>
<script>
    $("#typeGoods01").load("${pageContext.request.contextPath}/index/typeGoods?typeId=1");
    $("#typeGoods02").load("${pageContext.request.contextPath}/index/typeGoods?typeId=2");
</script>

<div class="footer">
    <div class="foot_link">
        <a href="#">关于我们</a>
        <span>|</span>
        <a href="#">联系我们</a>
        <span>|</span>
        <a href="#">招聘人才</a>
        <span>|</span>
        <a href="#">友情链接</a>
    </div>
    <p>CopyRight © 2016 北京天天生鲜信息技术有限公司 All Rights Reserved</p>
    <p>电话：010-****888 京ICP备*******8号</p>
</div>
<script type="text/javascript" src="js/slideshow.js"></script>
<script type="text/javascript">
    BCSlideshow('focuspic');
    var oFruit = document.getElementById('fruit_more');
    var oShownum = document.getElementById('show_count');

    var hasorder = localStorage.getItem('order_finish');

    if (hasorder) {
        oShownum.innerHTML = '2';
    }

    oFruit.onclick = function () {
        window.location.href = 'list.html';
    }
</script>
</body>
</html>
