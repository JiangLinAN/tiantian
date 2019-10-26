<%--
  Created by IntelliJ IDEA.
  User: NoRe
  Date: 2019/10/23
  Time: 17:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>天天生鲜-商品列表</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>
<jsp:include page="indexTop.jsp"/>
<div class="breadcrumb">
    <a href="#">全部分类</a>
    <span>></span>
    <a href="#">
        ${requestScope.goodType.typeName}
        ${requestScope.goodType.id}
    </a>
</div>

<div class="main_wrap clearfix">
    <div class="l_wrap fl clearfix">
        <div class="new_goods">
            <h3>新品推荐</h3>
            <ul>
                <c:forEach var="newGoods" items="${requestScope.pageInfo.list}" begin="0" end="1">
                    <li>
                        <a href="#"><img src="${pageContext.request.contextPath}/${newGoods.simg}"></a>
                        <h4><a href="#">${newGoods.goodName}</a></h4>
                        <div class="prize">￥${newGoods.price}</div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>

    <div class="r_wrap fr clearfix">
        <div class="sort_bar">
            <a id="a1"  class="" href="${pageContext.request.contextPath}/index/orderTime?typeId=1&pageNum=1">时间</a>
            <a id="a2" class="" href="${pageContext.request.contextPath}/index/orderPrice?typeId=1&pageNum=1">价格</a>
            <a id="a3" class="" href="#">人气</a>
        </div>

        <ul class="goods_type_list clearfix">
            <c:forEach var="goods" items="${requestScope.pageInfo.list}" begin="2">
                <li>
                    <a href="${pageContext.request.contextPath}/index/detail?goodId=${goods.id}"><img src="${pageContext.request.contextPath}/${goods.simg}"></a>
                    <h4><a href="${pageContext.request.contextPath}/index/detail?goodId=${goods.id}">
                            ${goods.goodName}
                                <fmt:formatDate value="${goods.time}" pattern="yyyy-MM-dd" />
                    </a>
                    </h4>
                    <div class="operate">
                        <span class="prize">￥${goods.price}</span>
                        <span class="unit">${goods.price}/500g</span>
                        <a href="#" class="add_goods" title="加入购物车"></a>
                    </div>
                </li>
            </c:forEach>
        </ul>

        <div class="pagenation">
            <a href="${pageContext.request.contextPath}/index/orderTime?typeId=${requestScope.goodType.id}&pageNum=${requestScope.pageInfo.prePage}">上一页</a>
            <a href="${pageContext.request.contextPath}/index/orderTime?typeId=${requestScope.goodType.id}&pageNum=${requestScope.pageInfo.prePage}">${requestScope.pageInfo.prePage}</a>
            <a href="${pageContext.request.contextPath}/index/orderTime?typeId=${requestScope.goodType.id}&pageNum=${requestScope.pageInfo.pageNum}" class="active">${requestScope.pageInfo.pageNum}</a>
            <a href="${pageContext.request.contextPath}/index/orderTime?typeId=${requestScope.goodType.id}&pageNum=${requestScope.pageInfo.nextPage}">${requestScope.pageInfo.nextPage}</a>
            <a href="${pageContext.request.contextPath}/index/orderTime?typeId=${requestScope.goodType.id}&pageNum=${requestScope.pageInfo.nextPage}">下一页</a>
        </div>
    </div>
</div>
<jsp:include page="indexLow.jsp"/>
</body>
</html>