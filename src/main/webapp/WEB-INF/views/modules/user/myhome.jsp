<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <title>个人主页</title>
    <meta charset=UTF-8">

    <link href="${ctx}/static/bootstrap/css/bootstrap.css" rel="stylesheet">

    <link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css">
    <style type="text/css">


        body.reader-night-mode .nqzzJ71pC-jOnJKAfdtr6_0 ._1RppgOJ_CQiXgzd3ke-sbJ_0 {
            background-color: #3f3f3f;
            color: #c8c8c8;
        }

        .nqzzJ71pC-jOnJKAfdtr6_0 ._1RppgOJ_CQiXgzd3ke-sbJ_0 h4 {
            margin: 0;
            line-height: 25px;
        }

        .nqzzJ71pC-jOnJKAfdtr6_0 ._1RppgOJ_CQiXgzd3ke-sbJ_0 h4 span {
            color: #e9634c;
        }

        .nqzzJ71pC-jOnJKAfdtr6_0 ._1RppgOJ_CQiXgzd3ke-sbJ_0 img {
            width: 190px;
            height: 190px;
            margin: 12px 0 8px 0;
        }

        .nqzzJ71pC-jOnJKAfdtr6_0 ._1RppgOJ_CQiXgzd3ke-sbJ_0 p {
            font-size: 14px;
            line-height: 20px;
            margin: 0;
        }

        .nqzzJ71pC-jOnJKAfdtr6_0 ._1RppgOJ_CQiXgzd3ke-sbJ_0 ._2WUz9DZJO5DIC_O5sD1kac_0 {
            background-color: #e9634c;
            color: #fff;
            margin: 25px auto 0;
            width: 190px;
            height: 40px;
            border-radius: 20px;
            line-height: 40px;
            font-size: 14px;
            cursor: pointer;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }
    </style>
    <link rel="stylesheet" href="/static/css/index.css" media="all">
    <style>
        body {
            padding-top: 56px;
        }
        .card h5{
            font-size: 1.25rem;
            margin-top: auto;
        }
        .card-header {
            padding: .75rem 1.25rem;
            margin-bottom: 0;
            background-color: rgba(0,0,0,.03);
            border-bottom: 1px solid rgba(0,0,0,.125);
        }
        a{
            text-decoration: none;
        }
        /*头像设置*/
        .nav  li a img{
            width: 50px;
            height: 50px;
        }

        .navbar-nav>li>a {
            line-height: 20px;
            margin-top: -12px;
        }

        .card-footer a{
            font-size: 16px;
            color: #4D4D4D;
        }

        a:hover{
            text-decoration: none;
        }


        .card {
            position: relative;
            display: -ms-flexbox;
            display: flex;
            -ms-flex-direction: column;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-color: #fff;
            background-clip: border-box;
            border: 1px solid rgba(0, 0, 0, .125);
            border-radius: .25rem;
        }

        .mb-4, .my-4 {
            margin-bottom: 1.5rem !important;
            margin-top: 10px;
        }

        .card-body {
            -ms-flex: 1 1 auto;
            flex: 1 1 auto;
            padding: 1.25rem;
        }

        .card-title {
            font-weight: 700;
        }

        .text-muted {
            color: #6c757d !important;
        }

        .card-footer {
            padding: .75rem 1.25rem;
            background-color: rgba(0, 0, 0, .03);
            border-top: 1px solid rgba(0, 0, 0, .125);
        }

        .card-footer a{
            margin-right: 15px;
        }

        .py-5{
            padding-bottom: 3rem!important;
            padding-top: 3rem!important;
        }

        .bg-dark{
            background-color: #343a40!important;
        }

        .text-white{
            color: #fff!important;
        }

        .card{
            overflow: hidden;
        }

        .test{
            overflow: hidden;
        }


        .test img{
           width: 100%;
            display: block;

        }
        .dropdown-menu a{
            color: #4D4D4D;
        }
    </style>

    <script src="/static/js/jquery.min.js"></script>
    <script>
        $(function () {
            $(".dropdown").mouseover(function () {
                $(this).addClass("open");
            });

            $(".dropdown").mouseleave(function () {
                $(this).removeClass("open");
            })
        })
    </script>
</head>
<body class="reader-black-font" style="overflow-y: scroll ">
<%--全局顶部导航栏--%>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="width-limit">

        <div class="container">
            <div class="collapse navbar-collapse">
                <%--左上方的logo--%>
                <a class="logo" href="/">
                    <img src="${ctx}/static/image/test1.png" alt="Nav logo">
                </a>

                <%--最右边的写作按钮--%>
                <a class="btn writen-btn" target="_blank" href="/article/write">
                    <i></i>
                    写文章
                </a>
                <%--注册--%>
                <c:if test="${empty user}">
                    <a class="btn sing-up" id="sing_up" href="/sing_up">注册</a>
                    <a class="btn log-in" id="sing_in" href="/sing_in">登录</a>
                </c:if>

                <c:if test="${not empty user}">
                    <div class="user">
                        <ul class="nav navbar-nav">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle"
                                   data-toggle="dropdown"
                                   style="height: 60px">
                                    <img alt="" class="img-circle" src="${user.imgUrl}" width="38px"
                                         height="38px"/>
                                </a>
                                <div class="dropdown-menu pull-right"
                                     style="background: #FFFFFF;width: 320px;overflow: hidden">
                                    <div style="margin-top: 16px;border-bottom: 1px solid #eeeeee">
                                        <div style="color: #323534;text-align: center;line-height: 36px;font-size: 17px">
                                            <span>${user.nickName}</span>
                                        </div>
                                    </div>

                                    <div class="row" style="margin-left: 15px;margin-right: 15px;margin-top: 10px">
                                        <div class="col-md-4 text-center grid">
                                            <i class="fa fa-user" style="font-size: 25px;line-height: 45px;"></i>
                                            <p style="padding: 0px;margin-top: 6px;margin-bottom: 10px;font-size: 12px">
                                                <a href="/myhome">我的主页</a></p>
                                        </div>
                                        <div class="col-md-4 text-center grid">
                                            <i class="fa fa-gear" style="font-size: 25px;line-height: 45px;"></i>
                                            <p style="padding: 0px;margin-top: 6px;margin-bottom: 10px;font-size: 12px">
                                                <a href="/user">账号管理</a></p>
                                        </div>
                                        <div class="col-md-4 text-center grid">
                                            <i class="fa fa-key" style="font-size: 25px;line-height: 45px;"></i>
                                            <p style="padding: 0px;margin-top: 6px;margin-bottom: 10px;font-size: 12px">
                                                <a href="/modifyPwd">密码修改</a></p>
                                        </div>
                                    </div>

                                    <div class="row" style="margin-top: 20px">
                                        <div class="text-center"
                                             style="padding: 15px;margin: 0px;background: #f6f5f5;color: #323534;">
                                            <i class="fa fa-sign-out"></i> <a href="/sing_out">退出</a>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</nav>

<!-- Page Content -->
<div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">Blog
        <small>MyHome</small>
    </h1>

    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a style="color: #973533" href="/">Home</a>
        </li>
        <%--<li class="breadcrumb-item active">Blog Home 1</li>--%>
    </ol>

    <div class="row">

        <!-- Blog Entries Column -->
        <div class="col-md-8">
            <c:forEach items="${articleList.list}" var="artilce">
                <div class="card mb-4">
                    <c:if test="${not empty artilce.imgUrl}">
                        <div class="test" style="height: 300px;width: 750px">
                            <img class="card-img-top" src="${artilce.imgUrl}" alt="Card image cap">
                        </div>

                    </c:if>
                    <div class="card-body">
                        <h2 class="card-title">${artilce.title}</h2>
                        <p class="card-text">${artilce.summary}......</p>
                        <a href="${ctx}/article/getContent?a=${artilce.id}" style="background-color: #60686f" class="btn btn-primary">Read More &rarr;</a>
                    </div>
                    <div class="card-footer text-muted">
                            ${artilce.writeDate} By

                        <a href="#" target="_blank">${artilce.auther}</a>
                        <a href="${ctx}/article/getContent?a=${artilce.id}"><i class="glyphicon glyphicon-heart">${artilce.likeCount}</i></a>
                        <a href="${ctx}/article/getContent?a=${artilce.id}"><i class="glyphicon glyphicon-comment">${artilce.commentCount}</i></a>

                    </div>
                </div>
            </c:forEach>
            <div class="row">
                <div class="col-md-6">
                    第${articleList.pageNum}页，共${articleList.pages}页，共${articleList.total}条记录
                </div>
                <div class="col-md-6 offset-md-4" style="width: 100%;margin-left: 25%">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination pagination-sm mb-4 ">
                            <li class="page-item"><a class="page-link" href="${ctx}/myhome?page=1">首页</a>
                            </li>
                            <c:if test="${articleList.hasPreviousPage}">
                                <li class="page-item"><a class="page-link"
                                                         href="${ctx}/myhome?page=${articleList.pageNum-1}">上一页</a>
                                </li>
                            </c:if>
                            <c:forEach items="${articleList.navigatepageNums}" var="page">
                                <c:if test="${page==articleList.pageNum}">
                                    <li class="page-item active"><a class="page-link" href="#">${page}</a></li>
                                </c:if>
                                <c:if test="${page!=articleList.pageNum}">
                                    <li class="page-item"><a class="page-link"
                                                             href="${ctx}/myhome?page=${page}">${page}</a>
                                    </li>
                                </c:if>
                            </c:forEach>
                            <c:if test="${articleList.hasNextPage}">
                                <li class="page-item"><a class="page-link"
                                                         href="${ctx}/myhome?page=${articleList.pageNum+1}">下一页</a>
                                </li>
                            </c:if>
                            <li class="page-item"><a class="page-link"
                                                     href="${ctx}/myhome?page=${articleList.pages}">末页</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>

        <!-- Sidebar Widgets Column -->
        <div class="col-md-4">

            <!-- Search Widget -->
            <div class="card mb-4">
                <h5 class="card-header">Search</h5>
                <div class="card-body">
                    <form id="searchform"  action="${ctx}/article/search" method="post">
                        <div class="input-group">
                            <input id="keyword" name="keyword" type="text" class="form-control" placeholder="Search for...">
                            <span class="input-group-btn">
                                <button class="btn btn-secondary" type="submit">Go!</button>
                            </span>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Categories Widget -->
            <div class="card my-4">
                <h5 class="card-header">Categories</h5>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-6">
                            <ul class="list-unstyled mb-0">
                                <li>
                                    <a href="#">Web Design</a>
                                </li>
                                <li>
                                    <a href="#">HTML</a>
                                </li>
                                <li>
                                    <a href="#">Freebies</a>
                                </li>
                            </ul>
                        </div>
                        <%--<div class="col-lg-6">--%>
                            <%--<ul class="list-unstyled mb-0">--%>
                                <%--<li>--%>
                                    <%--<a href="#">JavaScript</a>--%>
                                <%--</li>--%>
                                <%--<li>--%>
                                    <%--<a href="#">CSS</a>--%>
                                <%--</li>--%>
                                <%--<li>--%>
                                    <%--<a href="#">Tutorials</a>--%>
                                <%--</li>--%>
                            <%--</ul>--%>
                        <%--</div>--%>
                    </div>
                </div>
            </div>

            <!-- Side Widget -->
            <div class="card my-4">
                <h5 class="card-header">Side Widget</h5>
                <div class="card-body">
                    You can put anything you want inside of these side widgets. They are easy to use, and feature the
                    new Bootstrap 4 card containers!
                </div>
            </div>

        </div>

    </div>
    <!-- /.row -->

</div>
<!-- /.container -->

<!-- Footer -->
<footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Francis Blog 2020</p>
    </div>
    <!-- /.container -->
</footer>

<%----%>


</body>
</html>


