<%--
  Created by IntelliJ IDEA.
  User: Francis_Mt
  Date: 2020/2/27
  Time: 21:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>登录</title>
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
                    cellphone: function (value) {
                        var logname = $("#phone").val();
                        var message = "";
                        var myreg = /^[1](([3][0-9])|([4][5-9])|([5][0-3,5-9])|([6][5,6])|([7][0-8])|([8][0-9])|([9][1,8,9]))[0-9]{8}$/;
                        if (logname.length == 0) {
                            return "请输入手机号"
                        } else {
                            if (!myreg.test(logname)) {
                                message = "请输入正确的11位手机号"
                            }
                        }
                        return message;
                    }
                })
                form.on('submit(commit)', function (data) {
                    $.fn.serializeObject = function () {
                        var o = {};
                        var a = this.serializeArray();
                        $.each(a, function () {
                            if (o[this.name]) {
                                if (!o[this.name].push) {
                                    o[this.name] = [o[this.name]];
                                }
                                o[this.name].push(this.value || '');
                            } else {
                                o[this.name] = this.value || '';
                            }
                        });
                        return o;
                    };
                    var maintenancePlace = $("#loginForm").serializeObject();
                    $.ajax({
                        url: './login',
                        type: 'post',
                        // contentType: "application/x-www-form-urlencoded",
                        data: maintenancePlace,
                        success: function (data) {
                            if (data === "true") {
                                layer.open({
                                    content: "登录成功",
                                    yes: function () {
                                        window.location.href = "/";
                                    },
                                    cancel: function () {
                                        window.location.href = "/";
                                    }
                                });
                            }
                            if (data === "false") {
                                layer.msg("验证码错误，请输入正确的验证码")
                            }
                            else if (data == "null") {
                                layer.msg("该手机号未注册")
                            }
                            else if (data === "fail") {
                                layer.msg("账号或密码错误")
                            }
                        },
                        error: function (jqXHR) {
                            layer.msg("服务器异常，请稍后重试....");
                            // alert("发生错误：" + jqXHR.status);
                        }
                    });
                    return false;
                });
            });

            function placeholderfun() {

                if (!('placeholder' in document.createElement('input'))) {
                    function GetStringNumValue(pxstr) {
                        return pxstr.substring(0, pxstr.length - 2);
                    }

                    $('input[placeholder],textarea[placeholder]').each(function () {
                        var $element = $(this),
                            placeholder = $element.attr('placeholder');
                        if ($element.attr('type') != 'password') {//非密码
                            if ($element.val() === "") {
                                $element.val(placeholder).addClass('placeholder');
                                $element.css('color', '#ccc');
                            }
                            $element.focus(function () {
                                if ($element.val() === placeholder) {
                                    $element.val("").removeClass('placeholder');
                                    $element.css('color', '#000');
                                }
                            }).blur(function () {
                                if ($element.val() === "") {   //if($element.val()==="" &&  ($element.attr('type') != 'password')){
                                    $element.val(placeholder).addClass('placeholder');
                                    $element.css('color', '#ccc');
                                } else if ($element.val() == placeholder) {
                                    $element.css('color', '#ccc');
                                } else {
                                    $element.css('color', '#000');
                                }
                            }).closest('form').submit(function () {
                                if ($element.val() === placeholder) {
                                    $element.val('');
                                }
                            });
                        } else {//密码框
                            if (placeholder) {
                                // 文本框ID
                                var elementId = $element.attr('id');
                                if (!elementId) {
                                    var now = new Date();
                                    elementId = 'lbl_placeholder' + now.getSeconds() + now.getMilliseconds();
                                    $element.attr('id', elementId);
                                }
                            }//end of if (placeholder)
                             // 添加label标签，用于显示placeholder的值
                            var $label = $('<label>', {
                                html: $element.val() ? '' : placeholder,
                                'for': elementId,
                                css: {
                                    position: 'absolute',
                                    cursor: 'text',
                                    color: '#cccccc',
                                    fontSize: $element.css('fontSize'),
                                    fontFamily: $element.css('fontFamily')
                                }
                            }).insertAfter($element);
                            // 绑定事件
                            var _setPosition = function () {
                                $label.css({
                                    marginTop: '-30px',
                                    marginLeft: '10px'
                                });
                            };
                            var _resetPlaceholder = function () {
                                if ($element.val()) {
                                    $label.html(null);
                                }
                                else {
                                    _setPosition();
                                    $label.html(placeholder);
                                }
                            };
                            _setPosition();
                            $element.on('focus blur input keyup propertychange resetplaceholder', _resetPlaceholder);
                        }
                    });
                }
            }
        });
    </script>
</head>
<body>

<div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">
    <div class="layadmin-user-login-main">
        <div class="layadmin-user-login-box layadmin-user-login-header">
            <h2>Login</h2>
            <p>博客系统</p>
        </div>
        <form id="loginForm"  method="post" class="layui-form">
            <%--账号密码--%>
            <div class="layadmin-user-login-box layadmin-user-login-body layui-form main"
                 style="background-color: white ; box-shadow: 0 0 8px rgba(0,0,0,.1); font-size: medium">
                <div class="layui-form-item">
                    <label class="layadmin-user-login-icon layui-icon layui-icon-username"
                           for="phone"></label>
                    <input type="text" name="phone" id="phone" lay-verify="cellphone"
                           placeholder="手机号或邮箱" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <label class="layadmin-user-login-icon layui-icon layui-icon-password"
                           for="password"></label>
                    <input type="password" name="password" id="password" lay-verify="required"
                           placeholder="密码" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <div class="layui-row">
                        <div class="layui-col-xs7">
                            <label class="layadmin-user-login-icon layui-icon layui-icon-vercode" for="vercode"></label>
                            <input type="text" name="vercode" id="vercode" lay-verify="required" placeholder="图形验证码"
                                   class="layui-input"/>
                        </div>
                        <div class="layui-col-xs5">
                            <div style="margin-left: 10px;">
                                <img src="" id="imgVerify" onclick="this.src=this.src+'?'"
                                     class="layadmin-user-login-codeimg">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="layui-form-item" style="margin-bottom: 20px;">
                    <input type="checkbox" checked="checked" name="remember" lay-skin="primary" title="记住密码">
                    <div class="layui-unselect layui-form-checkbox" lay-skin="primary">
                        <span>记住密码</span>
                        <i class="layui-icon layui-icon-ok"></i>
                    </div>
                    <a href="${ctx}/forgetPwd" class="layadmin-user-jump-change layadmin-link"
                       style="margin-top: 7px;">忘记密码？</a>
                </div>
                <div class="layui-form-item">
                    <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="commit">登 入</button>
                </div>
                <div class="layui-trans layui-form-item layadmin-user-login-other">
                    <label>社交账号登入</label>
                    <a href="javascript:;"><i class="layui-icon layui-icon-login-qq"></i></a>
                    <a href="javascript:;"><i class="layui-icon layui-icon-login-wechat"></i></a>
                    <a href="javascript:;"><i class="layui-icon layui-icon-login-weibo"></i></a>

                    <a href="${ctx}/sing_up" class="layadmin-user-jump-change layadmin-link">注册帐号</a>
                </div>
            </div>
        </form>
    </div>
    <div class="layui-trans layadmin-user-login-footer">

        <p>© 2020 <a href="#" target="_blank">Francis</a></p>
        <%--<p>--%>
            <%--<span><a href="http://www.layui.com/admin/#get" target="_blank">获取授权</a></span>--%>
            <%--<span><a href="http://www.layui.com/admin/pro/" target="_blank">在线演示</a></span>--%>
            <%--<span><a href="http://www.layui.com/admin/" target="_blank">前往官网</a></span>--%>
        <%--</p>--%>
    </div>

</div>

<script src="../../layuiadmin/layui/layui.js"></script>
</body>
</html>
