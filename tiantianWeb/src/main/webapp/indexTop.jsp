<%--
  Created by IntelliJ IDEA.
  User: NoRe
  Date: 2019/10/23
  Time: 17:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
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
        <a href="index.html" class="logo fl"><img src="${pageContext.request.contextPath}/images/logo.png"></a>
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
                <li><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
                <li class="interval">|</li>
                <li><a href="">手机生鲜</a></li>
                <li class="interval">|</li>
                <li><a href="">抽奖</a></li>
            </ul>
        </div>
    </div>
</div>
