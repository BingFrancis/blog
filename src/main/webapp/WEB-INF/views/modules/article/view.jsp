<%--
  Created by IntelliJ IDEA.
  User: Francis_Mt
  Date: 2020/4/1
  Time: 20:56
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>HTML Preview(markdown to html) - Editor.md examples</title>
    <link rel="stylesheet" href="${ctx}/static/editor/css/editormd.preview.css"/>
    <!-- Bootstrap core CSS -->
    <link href="${ctx}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <link href="${ctx}/static/bootstrap/css/b">

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
            margin: 0;
            font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans",sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
            font-size: 2.5rem;
            font-weight: 400;
            line-height: 1.5;
            color: #212529;
            text-align: left;
            background-color: #fff;
        }

        /*头像设置*/
        .nav  li a img{
            width: 50px;
            height: auto;
        }

        .navbar-nav>li>a {
            line-height: 20px;
            margin-top: -12px;
        }

        /*评论头像设置*/
        .media,.mb-4 img{
            width: 50px;
            height: auto;
            border-radius: 50%!important;
        }

        a{
            text-decoration: none;
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


        .card-header {
            padding: .75rem 1.25rem;
            margin-bottom: 0;
            background-color: rgba(0,0,0,.03);
            border-bottom: 1px solid rgba(0,0,0,.125);
        }
        .card-header:first-child {
            border-radius: calc(.25rem - 1px) calc(.25rem - 1px) 0 0;
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
<body>
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
                                    <img alt="" class="img-circle" src="${ctx}/static/image/default.jpg" width="38px"
                                         height="38px"/>
                                </a>
                                <div class="dropdown-menu pull-right"
                                     style="background: #FFFFFF;width: 320px;overflow: hidden">
                                    <div style="margin-top: 16px;border-bottom: 1px solid #eeeeee">
                                        <div style="text-align: center">
                                            <img class="img-circle" src="${ctx}/static/image/default.jpg"
                                                 style="width: 38px;height: 38px;"/>
                                        </div>
                                        <div style="color: #323534;text-align: center;line-height: 36px;font-size: 17px">
                                            <span>${user.nickName}</span>
                                        </div>
                                    </div>

                                    <div class="row" style="margin-left: 15px;margin-right: 15px;margin-top: 10px">
                                        <div class="col-md-4 text-center grid">
                                            <i class="fa fa-user" style="font-size: 25px;line-height: 45px;"></i>
                                            <p style="padding: 0px;margin-top: 6px;margin-bottom: 10px;font-size: 12px">
                                                个人中心</p>
                                        </div>
                                        <div class="col-md-4 text-center grid">
                                            <i class="fa fa-gear" style="font-size: 25px;line-height: 45px;"></i>
                                            <p style="padding: 0px;margin-top: 6px;margin-bottom: 10px;font-size: 12px">
                                                账号管理</p>
                                        </div>
                                        <div class="col-md-4 text-center grid">
                                            <i class="fa fa-key" style="font-size: 25px;line-height: 45px;"></i>
                                            <p style="padding: 0px;margin-top: 6px;margin-bottom: 10px;font-size: 12px">
                                                密码修改</p>
                                        </div>
                                    </div>

                                    <div class="row" style="margin-left: 15px;margin-right: 15px;margin-top: 10px">
                                        <div class="col-md-4 text-center grid">
                                            <i class="fa fa-user-circle" style="font-size: 25px;line-height: 45px;"></i>
                                            <p style="padding: 0px;margin-top: 6px;margin-bottom: 10px;font-size: 12px">
                                                修改头像</p>
                                        </div>
                                        <div class="col-md-4 text-center grid">
                                            <i class="fa fa-comments" style="font-size: 25px;line-height: 45px;"></i>
                                            <p style="padding: 0px;margin-top: 6px;margin-bottom: 10px;font-size: 12px">
                                                消息</p>
                                        </div>
                                        <div class="col-md-4 text-center grid">
                                            <i class="fa fa-heart-o" style="font-size: 25px;line-height: 45px;"></i>
                                            <p style="padding: 0px;margin-top: 6px;margin-bottom: 10px;font-size: 12px">
                                                帮助中心</p>
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

<div class="container">
    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">${details.title}
        <small>by
            <a href="#">${details.auther}</a>
        </small>
    </h1>

    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="index.html">Home</a>
        </li>
        <li class="breadcrumb-item active">Blog Details</li>
    </ol>

    <div class="row">
        <div class="col-lg-8" id="test-editormd-view">
            <!-- Date/Time -->
            <p>Posted on January 1, 2017 at 12:00 PM</p>
            <textarea id="append-test" style="display:none;" name="test-editormd-markdown-doc">${details.content}</textarea>
            <hr>
        </div>

        <div class="col-lg-8">
            <!-- Comments Form -->
            <div class="card my-4">
                <h5 class="card-header">Leave a Comment:</h5>
                <div class="card-body">
                    <form>
                        <div class="form-group">
                            <textarea class="form-control" rows="3"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>


    </div>
    <!-- /.row -->

</div>
<div id="layout">
    <%--<div id="test-editormd-view">--%>
    <%--<textarea style="display:none;" name="test-editormd-markdown-doc"></textarea>--%>
    <%--</div>--%>
    <script src="/static/js/jquery.min.js"></script>
    <%--<script src="${ctx}/static/editor/editormd.min.js" type="text/javascript"></script>--%>
    <script src="${ctx}/static/editor/lib/marked.min.js"></script>
    <script src="${ctx}/static/editor/lib/prettify.min.js"></script>

    <script src="${ctx}/static/editor/lib/raphael.min.js"></script>
    <script src="${ctx}/static/editor/lib/underscore.min.js"></script>
    <script src="${ctx}/static/editor/lib/sequence-diagram.min.js"></script>
    <script src="${ctx}/static/editor/lib/flowchart.min.js"></script>
    <script src="${ctx}/static/editor/lib/jquery.flowchart.min.js"></script>

    <script src="${ctx}/static/editor/editormd.js"></script>
    <script type="text/javascript">
        $(function () {
            var testEditormdView, testEditormdView2;
            var markdown = document.getElementById("append-test").valueOf();
            testEditormdView = editormd.markdownToHTML("test-editormd-view", {
                markdown: markdown,//+ "\r\n" + $("#append-test").text(),
                //htmlDecode      : true,       // 开启 HTML 标签解析，为了安全性，默认不开启
                htmlDecode: "style,script,iframe",  // you can filter tags decode
                //toc             : false,
                tocm: true,    // Using [TOCM]
                //tocContainer    : "#custom-toc-container", // 自定义 ToC 容器层
                //gfm             : false,
                //tocDropdown     : true,
                markdownSourceCode: true, // 是否保留 Markdown 源码，即是否删除保存源码的 Textarea 标签
                emoji: true,
                taskList: true,
                tex: true,  // 默认不解析
                flowChart: true,  // 默认不解析
                sequenceDiagram: true,  // 默认不解析
            });

        });

        testEditormdView2 = editormd.markdownToHTML("test-editormd-view", {
            htmlDecode: "style,script,iframe",  // you can filter tags decode
            emoji: true,
            taskList: true,
            tex: true,  // 默认不解析
            flowChart: true,  // 默认不解析
            sequenceDiagram: true,  // 默认不解析
        });
    </script>


    <%--<script type="text/javascript">--%>
    <%--$(function () {--%>
    <%--var testEditormdView, testEditormdView2;--%>
    <%--$.get("", function (markdown) {--%>

    <%--testEditormdView = editormd.markdownToHTML("test-editormd-view", {--%>
    <%--markdown: markdown,//+ "\r\n" + $("#append-test").text(),--%>
    <%--//htmlDecode      : true,       // 开启 HTML 标签解析，为了安全性，默认不开启--%>
    <%--htmlDecode: "style,script,iframe",  // you can filter tags decode--%>
    <%--//toc             : false,--%>
    <%--tocm: true,    // Using [TOCM]--%>
    <%--//tocContainer    : "#custom-toc-container", // 自定义 ToC 容器层--%>
    <%--//gfm             : false,--%>
    <%--//tocDropdown     : true,--%>
    <%--// markdownSourceCode : true, // 是否保留 Markdown 源码，即是否删除保存源码的 Textarea 标签--%>
    <%--emoji: true,--%>
    <%--taskList: true,--%>
    <%--tex: true,  // 默认不解析--%>
    <%--flowChart: true,  // 默认不解析--%>
    <%--sequenceDiagram: true,  // 默认不解析--%>
    <%--});--%>

    <%--//console.log("返回一个 jQuery 实例 =>", testEditormdView);--%>

    <%--// 获取Markdown源码--%>
    <%--//console.log(testEditormdView.getMarkdown());--%>

    <%--//alert(testEditormdView.getMarkdown());--%>
    <%--});--%>

    <%--testEditormdView2 = editormd.markdownToHTML("test-editormd-view2", {--%>
    <%--htmlDecode: "style,script,iframe",  // you can filter tags decode--%>
    <%--emoji: true,--%>
    <%--taskList: true,--%>
    <%--tex: true,  // 默认不解析--%>
    <%--flowChart: true,  // 默认不解析--%>
    <%--sequenceDiagram: true,  // 默认不解析--%>
    <%--});--%>
    <%--});--%>
    <%--</script>--%>
</body>
</html>
