<%--
  Created by IntelliJ IDEA.
  User: NoRe
  Date: 2019/10/22
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul class="subnav fl">
    <c:forEach var="type" items="${sessionScope.types}" varStatus="count">
        <li><a href="#model0${count.index+1}" class="${type.simg}">${type.typeName}</a></li>
    </c:forEach>
</ul>
