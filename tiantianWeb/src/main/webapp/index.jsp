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
<jsp:include page="indexTop.jsp"/>
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

<jsp:include page="indexLow.jsp"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/slideshow.js"></script>
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
