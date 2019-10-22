<%--
  Created by IntelliJ IDEA.
  User: NoRe
  Date: 2019/10/21
  Time: 20:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<html>
<head>
    <title>测试</title>
</head>
<body>


<div class="right fl"><input class="yanzhengma" name="code" id="vcode" type="text" placeholder="验证码"/>
    <img id="pagecode" src="${pageContext.request.contextPath}/user/code"><label id="checkCode"></label>
</div>


<script type="application/javascript">
    $.ajax({
        type: "put",
        url: "${pageContext.request.contextPath}/user/test",
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify({username: "亚平", password: "123", mail: "123@qq.com"}),
    })
</script>

</body>
</html>
