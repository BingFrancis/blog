<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <title>信息修改</title>
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
    <link rel="stylesheet" href="/static/layui-v2.4.5/css/layui.css" media="all">
    <link rel="stylesheet" href="/static/layui-v2.4.5/css/admin.css" media="all">
    <link rel="stylesheet" href="/static/layui-v2.4.5/css/modules/layer/default/layer.css" media="all">

    <link id="layuicss-layer" rel="stylesheet"
          href="https://www.layui.com/admin/std/dist/layuiadmin/layui/css/modules/layer/default/layer.css?v=3.1.1"
          media="all">

    <script src="/static/js/jquery.min.js"></script>
    <script src="/static/layui-v2.4.5/layui.all.js"></script>
    <script src="/static/layer/layer.js"></script>
    <style>
        body {
            padding-top: 56px;
        }

        .card h5 {
            font-size: 1.25rem;
            margin-top: auto;
        }

        .card-header {
            padding: .75rem 1.25rem;
            margin-bottom: 0;
            background-color: rgba(0, 0, 0, .03);
            border-bottom: 1px solid rgba(0, 0, 0, .125);
        }

        a {
            text-decoration: none;
        }

        /*头像设置*/
        .nav li a img {
            width: 50px;
            height: 50px;
        }

        .navbar-nav > li > a {
            line-height: 20px;
            margin-top: -12px;
        }

        .card-footer a {
            font-size: 16px;
            color: #4D4D4D;
        }

        a:hover {
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

        .card-footer a {
            margin-right: 15px;
        }

        .card {
            overflow: hidden;
        }

        .savebtn{
            background-color: #6c666b;
            border: none;
            height: 34px;
        }



        .test img {
            width: 100%;
            display: block;

        }

        .tox{
            width: 100px;
            height: 100px;
        }
        .tox img{
            width: 100%;
            height: 100%;
            border: 1px solid #ddd;
            border-radius: 50%;
        }

        tr{
            border-bottom: 1px solid #f0f0f0;
        }
        .nick{
            padding: 5px 10px;
            font-size: 15px;
            border: 1px solid #c8c8c8;
            border-radius: 4px;
            background-color: hsla(0,0%,71%,.1);
        }

        .btn-hollow {
            font-size: 14px;
        }
        .btn-hollow {
            border: 1px solid rgba(59,194,29,.7);
            color: #42c02e!important;
            border-radius: 40px
        }
        .hideUrl{
            position: absolute;
            display: block!important;
            width: 82px;
            opacity: 0;
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


        function updateUser() {
            var nickName = document.getElementById("nickName").value;
            var email = document.getElementById("email").value;
            if (nickName  == ""){
                layer.msg("昵称不能为空");
                return;
            }
            if (!new RegExp('^[a-zA-Z0-9_\u4e00-\u9fa5\s·]+$').test(nickName)) {
                layer.msg("不能有特殊字符");
                return;
            }
            if (/(^\_)|(\__)|(\_+$)/.test(nickName)) {
                layer.msg("昵称前后不能有下划线")
                return;
            }
            else {
                $.ajax({
                    url: './checkNickName',
                    type: 'post',
                    dataType: 'json',
                    async: false,
                    // contentType: "application",
                    data: {"nickName": nickName},
                    success: function (data) {
                        if (data == false) {
                            layer.msg("昵称已被使用，换一个吧！");
                            return;
                        }else{
                            $.ajax({
                                url: '/updateUser',
                                type: 'post',
                                dataType:'json',
                                // contentType: "application/x-www-form-urlencoded",
                                data: {"nickName":nickName,"email":email},
                                async: false,
                                success: function (data) {
                                    if (data["data"] == "ok") {
                                        layer.msg("信息更新成功", {icon:1},
                                            function () {
                                                location.reload();
                                            });
                                    }
                                    else{
                                        layer.msg("数据提交失败,请稍后重试")
                                    }
                                },
                                error: function (jqXHR) {
                                    layer.msg("服务器异常，请稍后重试....");
                                }
                            });

                        }
                    },
                    error: function (jqXHR) {
                        layer.msg("服务器异常，请稍后重试....");
                    }
                });

            }
        }
    </script>

    <script lang="javascript">
        $(document).ready(function(){
            $("input[name='file']").change(function(){
                //FormData对象，
                //可以把form中所有表单元素的name与value组成一个queryString，提交到后台。
                //在使用Ajax提交时，使用FormData对象可以减少拼接queryString的工作量
                var formData = new FormData();
                formData.append("file",$("input[name='file']")[0].files[0]);
                $.ajax({
                    url:'/updatePhoto',
                    type:'post',
                    data: formData,
                    cache: false,
                    processData: false,
                    contentType: false,
                    success:function(data){
                        console.log(data);
                        if(data["data"]=="fail"){
                            alert(请稍后重试);
                        }
                    // #根据上传成功并返回压缩后的图片url，更新img标签src属性
                        if(data["data"]=="ok"){
                            layer.msg("头像上传成功", {icon:1})
                            $("#userphoto").attr("src",data["url"]);
                            $("#userphoto2").attr("src",data["url"]);
                            ocation.reload();
                        }
                        if(data["data"=="no"]){
                            alert("请重新登录");
                        }
                    },error:function(e){
                        console.log(e);
                    }
                });
            });
        });
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
                                    <img  id="userphoto2"  alt="" class="img-circle" src="${user.imgUrl}" width="38px"
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
        <small>Information</small>
    </h1>

    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a style="color: #973533" href="/">Home</a>
        </li>
        <%--<li class="breadcrumb-item active">Blog Home 1</li>--%>
    </ol>

    <div class="row">

        <!-- Sidebar Widgets Column -->
        <div class="col-md-4">
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
                        <div class="col-lg-6">
                            <ul class="list-unstyled mb-0">
                                <li>
                                    <a href="#">JavaScript</a>
                                </li>
                                <li>
                                    <a href="#">CSS</a>
                                </li>
                                <li>
                                    <a href="#">Tutorials</a>
                                </li>
                            </ul>
                        </div>
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

        <!-- Blog Entries Column -->
        <div class="col-md-8">
            <div class="card mb-4">
                <table>
                    <tr>
                        <td style="width: 180px">
                            <div class="tox">
                                <img id="userphoto" src="${user.imgUrl}"></img></div>
                        </td>
                        <td>
                            <form id="uploadForm"  method="post" enctype="multipart/form-data">
                                <a class="btn btn-hollow">
                                    <input unselectable="on" name="file" accept="image/*" type="file" class="hideUrl">
                                    更改头像
                                </a>
                            </form>
                        </td>
                    </tr>
                    <tr  style="height: 72.8px">
                        <td>昵称</td>
                        <td><input type="text"  id="nickName" class="nick" placeholder="请输入昵称" value="${user.nickName}"/></td>
                    </tr>
                    <tr  style="height: 72.8px">
                        <td>邮箱</td>
                        <td><input type="text" id="email" class="nick" placeholder="请输入邮箱"  value="${user.email}"/></td>
                    </tr>
                </table>
                   <input type="button"  onclick="updateUser()" class="savebtn" value="保存"/>
            </div>
        </div>
    </div>
</div>
</body>
</html>


