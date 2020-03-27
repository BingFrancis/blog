<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>
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
    <link href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
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
    <script src="http://cdn.bootcss.com/jquery/2.1.4/jquery.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap-hover-dropdown/2.0.10/bootstrap-hover-dropdown.min.js"></script>

</head>

<body class="reader-black-font" style="overflow-y: scroll ">
<%--全局顶部导航栏--%>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="width-limit">
        <%--左上方的logo--%>
        <a class="logo" href="/a">
            <img src="../../../static/image/download.png" alt="Nav logo">
        </a>
        <%--最右边的写作按钮--%>
        <a class="btn writen-btn" target="_blank" href="/writer#">
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
                <div   data-toggle="dropdown" data-hover="dropdown" data-delay="500" aria-expanded="true">
                    <a class="avator">
                        <img src="../../../static/image/default.jpg" alt="120">
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
            <%--<div class="user"  data-toggle="dropdown" data-hover="dropdown" id="dropdownMenu1">--%>
            <%--<div data-havor="dropdown">--%>
            <%--<a class="avator">--%>
            <%--<img src="../../../static/image/default.jpg" alt="头像">--%>
            <%--</a>--%>
            <%--</div>--%>
            <%--<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">--%>
            <%--<li><span>我得主页</span></li>--%>
            <%--<li><span>退出</span></li>--%>
            <%--&lt;%&ndash;&lt;%&ndash;<li>&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;<a href="/u/d4dfbb4d3aa9">&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;<i class="iconfont ic-navigation-profile"></i><span>我的主页</span>&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;</a></li>&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;<li>&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;<!-- TODO bookmarks_path -->&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;<a href="/bookmarks">&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;<i class="iconfont ic-navigation-mark"></i><span>收藏的文章</span>&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;</a></li>&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;<li>&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;<a href="/users/d4dfbb4d3aa9/liked_notes">&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;<i class="iconfont ic-navigation-like"></i><span>喜欢的文章</span>&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;</a></li>&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;<li>&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;<a href="/my/paid_notes">&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;<i class="iconfont ic-paid"></i><span>已购内容</span>&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;</a></li>&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;<li>&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;<a href="/wallet">&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;<i class="iconfont ic-navigation-wallet"></i><span>我的钱包</span>&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;</a></li>&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;<li>&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;<a href="/settings">&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;<i class="iconfont ic-navigation-settings"></i><span>设置</span>&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;</a></li>&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;<li>&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;<a href="/faqs">&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;<i class="iconfont ic-navigation-feedback"></i><span>帮助与反馈</span>&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;</a></li>&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;<li>&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;<a rel="nofollow" data-method="delete" href="/sign_out">&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;<i class="iconfont ic-navigation-signout"></i><span>退出</span>&ndash;%&gt;&ndash;%&gt;--%>
            <%--&lt;%&ndash;&lt;%&ndash;</a></li>&ndash;%&gt;&ndash;%&gt;--%>
            <%--</ul>--%>
            <%--</div>--%>

        </c:if>

    </div>
</nav>
<div>身体</div>
<div>侧边栏</div>
<%--<footer class="container">--%>
<%--<div class="row">--%>
<%--<div class="col-xs-17 main">--%>
<%--<a target="_blank" href="/">关于我们</a>--%>
<%--<a target="_blank" href="/">关于我们</a>--%>
<%--<a target="_blank" href="/">关于我们</a>--%>
<%--</div>--%>
<%--<div class="icon-bar">--%>
<%--@2019-2020 Francis--%>
<%--<a target="_blank" href="/">关于我们</a>--%>
<%--<a target="_blank" href="/">关于我们</a>--%>
<%--</div>--%>
<%--</div>--%>
<%--</footer>--%>
</body>
</html>
