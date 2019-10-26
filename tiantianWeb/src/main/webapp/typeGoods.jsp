<%--
  Created by IntelliJ IDEA.
  User: NoRe
  Date: 2019/10/22
  Time: 19:50  标记
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="list_model">
    <div class="list_title clearfix">
        <h3 class="fl" id="model01">${requestScope.typeAndGoods.typeName}</h3>
        <div class="subtitle fl">
            <span>|</span>
            <c:forEach var="good01" items="${requestScope.typeAndGoods.goods}">
                <a href="#">${good01.goodName}</a>
            </c:forEach>
        </div>
        <a href="${pageContext.request.contextPath}/index/orderTime?typeId=${requestScope.typeAndGoods.id}&pageNum=1" class="goods_more fr" id="fruit_more">查看更多 ></a>
    </div>

    <div class="goods_con clearfix">
        <div class="goods_banner fl"><img src="${requestScope.typeAndGoods.bimg}"></div>
        <ul class="goods_list fl">
            <c:forEach var="good02" items="${requestScope.typeAndGoods.goods}">
                <li>
                    <h4><a href="#">${good02.goodName}</a></h4>
                    <a href="${pageContext.request.contextPath}/index/detail?goodId=${good02.id}"><img src="${good02.simg}"></a>
                    <div class="prize">${good02.price}</div>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>
