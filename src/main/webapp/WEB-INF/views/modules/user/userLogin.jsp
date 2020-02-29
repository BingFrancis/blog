<%--
  Created by IntelliJ IDEA.
  User: Francis_Mt
  Date: 2020/2/24
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link  rel="stylesheet" href="/static/css/sing.css">
</head>
<body>
    <div  class="sign">
        <div class="logo">logo</div>
        <div class="main">
            <h4 class="tit">
                <div  class="normal-title">
                    <a class="active"  href="/sing_in">登录</a>
                    <b>·</b>
                    <a>注册</a>
                </div>
            </h4>
            <div class="sing-continer">
                <form>
                    <div class="input-prepend">
                        <input id="userName" type="text" placeholder="手机或邮箱"/>
                        <i></i>
                    </div>

                    <div>
                        <input id="password" type="password" placeholder="密码">
                        <i></i>
                    </div>

                    <div class="rember-btn">
                        <input type="checkbox" value="true" checked="checked" name="" id="">
                    </div>


                </form>
            </div>

        </div>
    </div>
</body>
</html>
