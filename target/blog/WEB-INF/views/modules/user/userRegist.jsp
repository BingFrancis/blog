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
        });
    </script>


    <script type="text/javascript">
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
                nickname: function (value) {
                    if(!new RegExp('^[a-zA-Z0-9_\u4e00-\u9fa5\s·]+$').test(value)){
                        return '不能有特殊字符';
                    }
                    if(/(^\_)|(\__)|(\_+$)/.test(value)){
                        return '首尾不能出现下划线\'_\'';
                    }
                    var minlength = $(item).attr("minlength");
                    if(minlength && value.length < minlength){
                        return '长度至少为'+minlength+"位";
                    }
                    if(/^\d+$/.test(value)){
                        return '不能全为数字';
                    }
                    var nickname = $("#nickname").val();
                    if (value == "") {
                        return "请填入一个昵称"
                    } else {
                        $.ajax({
                            url: './checkNickName',
                            type: 'post',
                            dataType: 'json',
                            async: false,
                            // contentType: "application",
                            data: {"nickName": nickname},
                            success: function (data) {
                                if (data == false) {
                                    message = "昵称已被使用，换一个吧！";
                                }
                            }
                        });
                    }
                }, vercode: function (value) {
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

            //表单提交验证
            form.on('submit(test1)', function (data) {
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
                var maintenancePlace = $("#form1").serializeObject();

                $.ajax({
                    url: './save',
                    type: 'post',
                    // contentType: "application/x-www-form-urlencoded",
                    data: maintenancePlace,
                    success: function (data) {
                        if (data === "true") {
                            layer.open({
                                content: "注册成功！请登录",
                                yes: function () {
                                    window.location.href = "/";
                                },
                                cancel: function () {
                                    window.location.href = "/";
                                }
                            });
                        }
                        if (data === "error") {
                            layer.msg("验证码错误，请输入正确的验证码")
                        }
                        if (data === "past") {
                            layer.msg("验证码已失效，请重新获取验证码")
                        }
                        if (data === "false") {
                            layer.msg("数据提交失败")
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

            <form  id="form1" method="post" modelAttribute="user" class="layui-form">
                <div class="layui-form-item">
                    <label class="layadmin-user-login-icon layui-icon layui-icon-username"
                           for="nickname"></label>
                    <input type="text" name="nickname" id="nickname" lay-verify="nickname" placeholder="昵称"
                           class="layui-input">
                </div>

                <div class="layui-form-item">
                    <label class="layadmin-user-login-icon layui-icon layui-icon-cellphone"
                           for="LAY-user-login-cellphone"></label>
                    <input type="text" name="cellphone" id="LAY-user-login-cellphone" lay-verify="phone"
                           placeholder="手机"
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
                    <input type="password" name="password" id="LAY-user-login-password" lay-verify="pass"
                           placeholder="密码"
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

            </form>

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


</body>
</html>