<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--<jsp:forward page="/article/getArticles"></jsp:forward>--%>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <title>主页，书写你的传奇</title>
    <meta charset=UTF-8">
    <style type="text/css">
        ._242Tf2cgmp6rFj7Lixbrm-_0 {
            margin-bottom: 20px;
            border-radius: 4px;
            overflow: hidden;
        }

        ._3aA9gkn1LXfMfmJOGrvppf_0 {
            position: relative;
            display: block;
            width: 100%;
            height: 100%;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }

        ._2fJUc3LXSiPHLwDfnBtS6y_0 {
            position: absolute;
            display: block;
            bottom: 0;
            right: 0;
            font-size: 12px;
            padding: 2px 6px;
            background-color: rgba(0, 0, 0, 0.5);
            color: #fff;
            cursor: pointer;
        }
    </style>
    <style type="text/css">.style-mode {
        float: right
    }</style>
    <link href="${ctx}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        .nqzzJ71pC-jOnJKAfdtr6_0 {
            float: right;
            height: 55px;
            padding: 15px 0px;
            margin: 0 12px;
        }

        ._3tScN0zmSdGLaUAH4SxTbM_0 {
            width: 100%;
            height: 100%;
        }

        .nqzzJ71pC-jOnJKAfdtr6_0 ._3f806byixOPpOPWnx8HiQP_0 {
            height: 25px;
        }

        .nqzzJ71pC-jOnJKAfdtr6_0 ._2MIQ6sBppQZAKea91We0qf_0 {
            position: fixed;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            width: 100%;
            height: 100%;
            background-color: #000;
            opacity: 0.6;
            z-index: 1000;
        }

        .nqzzJ71pC-jOnJKAfdtr6_0 ._1RppgOJ_CQiXgzd3ke-sbJ_0 {
            position: fixed;
            left: -webkit-calc(50% - 190px);
            left: calc(50% - 190px);
            top: -webkit-calc(50% - 300px);
            top: calc(50% - 300px);
            width: 380px;
            height: 425px;
            background-color: #fff;
            padding: 40px 72px 0;
            -webkit-box-align: center;
            -webkit-align-items: center;
            -ms-flex-align: center;
            align-items: center;
            -webkit-box-pack: center;
            -webkit-justify-content: center;
            -ms-flex-pack: center;
            justify-content: center;
            z-index: 1000;
            text-align: center;
        }

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

        .carousel-item {
            height: 65vh;
            min-height: 300px;
            background: no-repeat center center scroll;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }

        .portfolio-item {
            margin-bottom: 30px;
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

        .rounded {
            border-radius: .25rem !important;
        }

        .img-fluid {
            max-width: 100%;
            height: auto;
        }

        .img {
            object-fit: cover;
            height: 208px;
            overflow: hidden;
            text-align: center;
            margin: 0 auto;
            transform: inherit;
            /*display: flex;*/
            /*justify-content: center;*/
            /*align-items: center;*/
        }

        .img img {
            background-repeat: no-repeat;
        / / 背景图像将仅显示一次。 background-attachment: scroll;
        / / background-position: - 50 px 0 px;
        / / 设置背景图片的的偏移量，这个-50相当于背景整体向左偏移50，就可以显示图片的中心 background-size: 300 px 200 px;
        / / / / 设置背景图片的大小，相当于图片实际宽高等比例饿缩放的 background-color: transparent;
        / / height: auto;
            width: auto;
            object-fit: unset;
        }
    </style>
    <script src="/static/js/jquery.min.js"></script>

</head>
<body class="reader-black-font" style="overflow-y: scroll ">
<%--全局顶部导航栏--%>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="width-limit">
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
                    <%--<button type="button" class="btn dropdown-toggle" id="dropdownMenu2"--%>
                    <%--data-toggle="dropdown" data-hover="dropdown">--%>
                    <%--主题--%>
                    <%--<span class="caret"></span>--%>
                    <%--</button>--%>
                <div data-toggle="dropdown" data-hover="dropdown" data-delay="500" aria-expanded="true">
                    <a class="avator">
                        <img src="${ctx}/static/image/default.jpg" alt="120">
                    </a>
                </div>

                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                    <li role="presentation">
                        <a role="menuitem" tabindex="-1" href="#">Java</a>
                    </li>
                    <li role="presentation">
                        <a role="menuitem" tabindex="-1" href="#">数据挖掘</a>
                    </li>
                    <li role="presentation">
                        <a role="menuitem" tabindex="-1" href="#">
                            数据通信/网络
                        </a>
                    </li>
                    <li role="presentation" class="divider"></li>
                    <li role="presentation">
                        <a role="menuitem" tabindex="-1" href="#">分离的链接</a>
                    </li>
                </ul>
            </div>
        </c:if>
        <div class="container">
            <div class="collapse navbar-collapse">
                <%--左上方的logo--%>
                <a class="logo" href="/a">
                    <img src="${ctx}/static/image/test1.png" alt="Nav logo">
                </a>
                <ul class="nav navbar-nav">
                    <li class="" style="margin-left: 20px">
                        <a href="/">
                            <span>首页 </span>
                        </a>
                    </li>
                    <li style="padding-left: 20px;padding-top: 10px">
                        <from target="_blank" action="/search" method="get">
                            <input type="text" name="" id="" placeholder="搜索"
                                   style="height: 40px;width: 300px;border-radius: 30px">
                            <a class="icon-search"></a>
                        </from>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>
<div class="split-line"></div>
<div class="container">
    <div class="card mb-4">
        <div class="card-body">
            <div class="row">
                <div class="col-lg-6 img">
                    <a href="#">
                        <img id="test" class="img-fluid rounded" src="${ctx}/static/image/test.png" alt="">
                    </a>
                </div>
                <div class="col-lg-6">
                    <h3 class="card-title">
                        啦啦啦阿啦啦啦啦啦啦啦了asdcs啊称得上是我才是v是VS的VS
                    </h3>
                    <p class="card-text"> 顿时我就觉得，我真的做错了！自从孩子出生后，我把所有的精力都放在孩子身上，
                        却把过多的压力和怨气发在了丈夫身上。在他面前，我觉得自己还是个孩子，可以任性，可以跋扈，他都会迁就我的。
                        可惜我错了，我跟他没有血缘关系，我们之间更多的是爱和责任。当他说不爱了，责任他也不想再负了！
                    </p>
                </div>
            </div>


        </div>
        <div class="card-footer text-muted">
            Posted on January 1, 2017 by
            <a href="#">Start Bootstrap</a>
        </div>
    </div>


    <div class="card mb-4">
        <div class="card-body">
            <div class="row">
                <%--<div class="col-lg-6 img">--%>
                <%--<a href="#">--%>
                <%--<img id="tes1t" class="img-fluid rounded" src="${ctx}/static/image1/test.png" alt="">--%>
                <%--</a>--%>
                <%--</div>--%>
                <div class="col-lg-6" style="width: 100%">
                    <h3 class="card-title">
                        <a>啦啦啦阿啦啦啦啦啦啦啦了asdcs啊称得上是我才是v是VS的VS</a>
                    </h3>
                    <p class="card-text"> 顿时我就觉得，我真的做错了！自从孩子出生后，我把所有的精力都放在孩子身上，
                        却把过多的压力和怨气发在了丈夫身上。在他面前，我觉得自己还是个孩子，可以任性，可以跋扈，他都会迁就我的。
                        可惜我错了，我跟他没有血缘关系，我们之间更多的是爱和责任。当他说不爱了，责任他也不想再负了！
                    </p>
                </div>
            </div>


        </div>
        <div class="card-footer text-muted">
            Posted on January 1, 2017 by
            <a href="#">Start Bootstrap</a>
        </div>
    </div>

    <c:forEach items="${articleList.list}" var="artilce">
        <tr>
            <td>${artilce.title}</td>
            <td>${artilce.content}</td>
        </tr>
    </c:forEach>

    <div class="row">
        <div class="col-md-6">
            第${articleList.pageNum}页，共${articleList.pages}页，共${articleList.total}条记录
        </div>
        <div class="col-md-6 offset-md-4">
            <nav aria-label="Page navigation example">
                <ul class="pagination pagination-sm">
                    <li class="page-item"><a class="page-link" href="${ctx}/article/getArticles?page=1">首页</a></li>
                    <c:if test="${articleList.hasPreviousPage}">
                        <li class="page-item"><a class="page-link"
                                                 href="${ctx}/article/getArticles?page=${articleList.pageNum-1}">上一页</a></li>
                    </c:if>
                    <c:forEach items="${articleList.navigatepageNums}" var="page">
                        <c:if test="${page==articleList.pageNum}">
                            <li class="page-item active"><a class="page-link" href="#">${page}</a></li>
                        </c:if>
                        <c:if test="${page!=articleList.pageNum}">
                            <li class="page-item"><a class="page-link"
                                                     href="${ctx}/article/getArticles?page=${page}">${page}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${articleList.hasNextPage}">
                        <li class="page-item"><a class="page-link"
                                                 href="${ctx}/article/getArticles?page=${articleList.pageNum+1}">下一页</a></li>
                    </c:if>
                    <li class="page-item"><a class="page-link" href="${ctx}/article/getArticles?page=${articleList.pages}">末页</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>


</div>
<!-- Footer -->
<footer class="py-5 bg-dark">
    <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
</footer>

</body>
</html>


