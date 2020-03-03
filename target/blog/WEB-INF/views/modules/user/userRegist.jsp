<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>注册 - layuiAdmin</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">

    <%--<link rel="stylesheet" href="/static/css/login1.css">--%>
    <link rel="stylesheet" href="/static/layui-v2.4.5/css/layui.css" media="all">
    <link rel="stylesheet" href="/static/layui-v2.4.5/css/admin.css" media="all">
    <link rel="stylesheet" href="/static/layui-v2.4.5/css/login.css" media="all">
    <link rel="stylesheet" href="/static/layui-v2.4.5/css/modules/layer/default/layer.css" media="all">

    <link id="layuicss-layer" rel="stylesheet"
          href="https://www.layui.com/admin/std/dist/layuiadmin/layui/css/modules/layer/default/layer.css?v=3.1.1"
          media="all">


    <script src="/static/js/jquery.min.js"></script>
    <script src="/static/layui-v2.4.5/layui.all.js"></script>
    <script src="/static/layer/layer.js"></script>

    <style type="text/css">
        .sign-up-msg {
            margin: 10px 0;
            padding: 0;
            text-align: center;
            font-size: 12px;
            line-height: 20px;
            color: #969696;
            font-size: medium;
        }

        .more-sign h6 {
            position: relative;
            margin: 0 0 10px;
            font-size: 12px;
            color: #b5b5b5;
            ont-family: inherit;
            font-weight: 500;
            line-height: 1.1;
        }
    </style>


    <script type="text/javascript">
        $(document).ready(function () {
            $("#imgVerify").attr("src", "/getVerify?id=" + Math.random());
            layui.use(['form', 'layedit', 'laydate', 'layer'], function () {
                var form = layui.form
                    , admin = layui.admin
                    , setter = layui.setter
                    , layer = layui.layer
                    , layedit = layui.layedit
                    , laydate = layui.laydate;
                //自定义校验(---字段为lay-verify的值---)
                //日期
                laydate.render({
                    elem: '#date'
                });
                laydate.render({
                    elem: '#date1'
                });
                form.render();
                form.verify({
                    vercode: function (value) {
                        var messagecode = "";
                        if (value == "") {
                            messagecode = "请填入图形验证码"
                        }
                        else {
                            messagecode = "good";
                        }
                        return messagecode
                    }
                });
            });
        });
    </script>


</head>
<body>
<div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">
    <div class="layadmin-user-login-main">
        <div class="layadmin-user-login-box layadmin-user-login-header">
            <h2>layuiAdmin</h2>
            <p>layui 官方出品的单页面后台管理模板系统</p>
        </div>
        <div class="layadmin-user-login-box layadmin-user-login-body layui-form"
             style="background-color: white ; box-shadow: 0 0 8px rgba(0,0,0,.1); font-size: medium">
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-username"
                       for="LAY-user-login-nickname"></label>
                <input type="text" name="nickname" id="LAY-user-login-nickname" lay-verify="nickname" placeholder="昵称"
                       class="layui-input">
            </div>

            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-cellphone"
                       for="LAY-user-login-cellphone"></label>
                <input type="text" name="cellphone" id="LAY-user-login-cellphone" lay-verify="phone" placeholder="手机"
                       class="layui-input">
            </div>

            <div class="layui-form-item">
                <div class="layui-row">
                    <div class="layui-col-xs7">
                        <input id="code" type="text" name="code" placeholder="请输入图片验证码" lay-verify="vercode"
                               maxlength="6" class="layui-input"/>
                    </div>
                    <div class="layui-col-xs5">
                        <div style="margin-left: 10px;">
                            <img id="imgVerify" src="" onclick="this.src=this.src+'?'"
                                 style="width: 130px; height:35px"/>
                        </div>
                    </div>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-row">
                    <div class="layui-col-xs7">
                        <label class="layadmin-user-login-icon layui-icon layui-icon-vercode"
                               for="LAY-user-login-vercode"></label>
                        <input type="text" name="vercode" id="LAY-user-login-vercode" lay-verify="required"
                               placeholder="验证码" class="layui-input">
                    </div>
                    <div class="layui-col-xs5">
                        <div style="margin-left: 10px;">
                            <button type="button" class="layui-btn layui-btn-primary layui-btn-fluid"
                                    id="LAY-user-getsmscode">获取验证码
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-password"
                       for="LAY-user-login-password"></label>
                <input type="password" name="password" id="LAY-user-login-password" lay-verify="pass" placeholder="密码"
                       class="layui-input">
            </div>
            <%--<div class="layui-form-item">--%>
            <%--<label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-repass"></label>--%>
            <%--<input type="password" name="repass" id="LAY-user-login-repass" lay-verify="required" placeholder="确认密码" class="layui-input">--%>
            <%--</div>--%>

            <%--<div class="layui-form-item" style="height: 28px;">--%>
            <%--<input type="checkbox" id="agreement" lay-verify="agreement" lay-skin="primary" title="同意用户协议"--%>
            <%--checked>--%>
            <%--<a onclick="show();" href="javascript:;"   style="padding: -20px 0 0;margin: 20px 0px 0px">《使用说明》</a>--%>
            <%--<input type="text"  style="display: none" class="layui-input">--%>
            <%--</div>--%>
            <div class="layui-form-item">
                <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="LAY-user-reg-submit">注 册</button>
            </div>
            <p class="sign-up-msg">点击 “注册” 即表示您同意并愿意遵守简书<br> <a target="_blank"
                                                                href="http://www.jianshu.com/p/c44d171298ce">《用户协议》</a>
                和 <a target="_blank" href="http://www.jianshu.com/p/2ov8x3">《隐私政策》</a> 。</p>
            <div class="more-sign">
                <h6>社交帐号直接注册</h6>
                <ul>
                    <li><a id="weixin" class="weixin" target="_blank" href="/users/auth/wechat"><i
                            class="iconfont ic-wechat"></i></a></li>
                    <li><a id="qq" class="qq" target="_blank" href="/users/auth/qq_connect"><i
                            class="iconfont ic-qq_connect"></i></a></li>
                </ul>

            </div>
        </div>

    </div>
</div>

<%--<div class="layui-trans layui-form-item layadmin-user-login-other">--%>
    <%--<label>社交账号注册</label>--%>
    <%--<a href="javascript:;"><i class="layui-icon layui-icon-login-qq"></i></a>--%>
    <%--<a href="javascript:;"><i class="layui-icon layui-icon-login-wechat"></i></a>--%>
    <%--<a href="javascript:;"><i class="layui-icon layui-icon-login-weibo"></i></a>--%>

    <%--<a href="login.html" class="layadmin-user-jump-change layadmin-link layui-hide-xs">用已有帐号登入</a>--%>
    <%--<a href="login.html" class="layadmin-user-jump-change layadmin-link layui-hide-sm layui-show-xs-inline-block">登入</a>--%>
<%--</div>--%>

<div class="layui-trans layadmin-user-login-footer">

    <p>© 2018 <a href="http://www.layui.com/" target="_blank">layui.com</a></p>
    <p>
        <span><a href="http://www.layui.com/admin/#get" target="_blank">获取授权</a></span>
        <span><a href="http://www.layui.com/admin/pro/" target="_blank">在线演示</a></span>
        <span><a href="http://www.layui.com/admin/" target="_blank">前往官网</a></span>
    </p>
</div>

<script src="../../layuiadmin/layui/layui.js"></script>
<script>
    layui.config({
        base: '../../layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'user'], function () {
        var $ = layui.$
            , setter = layui.setter
            , admin = layui.admin
            , form = layui.form
            , router = layui.router();

        form.render();

        //提交
        form.on('submit(LAY-user-reg-submit)', function (obj) {
            var field = obj.field;

            //确认密码
            if (field.password !== field.repass) {
                return layer.msg('两次密码输入不一致');
            }

            //是否同意用户协议
            if (!field.agreement) {
                return layer.msg('你必须同意用户协议才能注册');
            }

            //请求接口
            admin.req({
                url: layui.setter.base + 'json/user/reg.js' //实际使用请改成服务端真实接口
                , data: field
                , done: function (res) {
                    layer.msg('注册成功', {
                        offset: '15px'
                        , icon: 1
                        , time: 1000
                    }, function () {
                        location.hash = '/user/login'; //跳转到登入页
                    });
                }
            });

            return false;
        });
    });
</script>
</body>
</html>