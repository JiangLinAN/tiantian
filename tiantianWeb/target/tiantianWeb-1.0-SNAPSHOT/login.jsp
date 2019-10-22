<%--
  Created by IntelliJ IDEA.
  User: NoRe
  Date: 2019/10/21
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>天天生鲜-登录</title>
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<div class="login_top clearfix">
    <a href="index.html" class="login_logo"><img src="images/logo02.png"></a>
</div>

<div class="login_form_bg">
    <div class="login_form_wrap clearfix">
        <div class="login_banner fl"></div>
        <div class="slogan fl">日夜兼程 · 急速送达</div>
        <div class="login_form fr">
            <div class="login_title clearfix">
                <h1>用户登录</h1>
                <a href="register.jsp">立即注册</a>
            </div>
            <div class="form_input">

                <input type="text" id="username" name="username" class="name_input" placeholder="请输入用户名">
                <div class="user_error">输入错误</div>
                <input type="password" id="password" name="pwd" class="pass_input" placeholder="请输入密码">
                <div class="pwd_error">输入错误</div>
                <div style="position: absolute;left: 0;top: 120px;">
                    <img id="cap" src="${pageContext.request.contextPath}/captcha"
                         style="width: 150px;height: 25px">
                    <input onblur="checkcap(this)"
                           style="background: #fdfdfd;height: 25px;width: 150px;vertical-align: middle;">
                </div>
                <div class="more_input clearfix">
                    <input type="checkbox" name="">
                    <label>记住用户名</label>
                    <a href="#">忘记密码</a>
                </div>
                <input type="button" name="" value="登录" class="input_submit" onclick="loginuser()">

            </div>
        </div>
    </div>
</div>

<div class="footer no-mp">
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

</body>
<script>
    $(function () {
        $("#cap").click(function () {
            //刷新验证码
            path = $(this).attr("src") + "?" + new Date().getTime();
            $(this).attr("src", path);
        });
    });

    function loginuser() {
        $.ajax({
            type: 'post',
            url: "http://localhost:8080/tiantianWeb_war_exploded/user/login",
            contentType: 'application/json',
            data: JSON.stringify({
                "username": $("#username").val(),
                "password": $("#password").val()
            }),
            success: function (status) {
                alert(status.msg)
                if (status.msg=="登录成功"){
                    location.href="http://localhost:8080/tiantianWeb_war_exploded/index.jsp"
                }
            },
            error: function () {
                alert("登录错误")
            }
        })
    }

</script>
</html>
