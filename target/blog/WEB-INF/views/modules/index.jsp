<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>
<html>
<head>
    <title>主页，书写你的传奇</title>
    <link rel="stylesheet" href="/static/css/index.css" media="all">
    <meta charset=UTF-8">
</head>
<body class="reader-black-font">
<%--全局顶部导航栏--%>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="width-limit">
        <%--左上方的logo--%>
        <a class="logo" href="/a">
            <img src="../../../static/image/download.png" alt="Nav logo">
        </a>
        <c:if test="${ not empty user}">
            <a name="tj_loginp" href="javascript:void(0);"   class="lb" onclick="personal('${user.id}');" style="color: black"><font color="#9370db">${user.nickName}, 欢迎您！</font></a>

        </c:if>
        <%--最右边的写作按钮--%>
        <a class="btn writen-btn" target="_blank" href="/writer#">
            <i></i>
            写文章
        </a>
        <%--注册--%>
        <a class="btn sing-up"  id="sing_up" href="/sing_up">注册</a>
        <a class="btn log-in" id="sing_in" href="/sing_in">登录</a>
    </div>

</nav>
<div>身体</div>
<div>侧边栏</div>
<footer>底部栏</footer>
</body>
</html>
