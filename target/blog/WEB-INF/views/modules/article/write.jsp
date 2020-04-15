<%--
  Created by IntelliJ IDEA.
  User: Francis_Mt
  Date: 2020/3/26
  Time: 22:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>
<html>
<head>
    <title>写作</title>
</head>
<link href="${ctx}/static/editor/css/editormd.min.css" rel="stylesheet">

<link rel="stylesheet" href="/static/layui-v2.4.5/css/layui.css" media="all">
<link rel="stylesheet" href="/static/layui-v2.4.5/css/admin.css" media="all">
<link rel="stylesheet" href="/static/layui-v2.4.5/css/modules/layer/default/layer.css" media="all">

<link id="layuicss-layer" rel="stylesheet"
href="https://www.layui.com/admin/std/dist/layuiadmin/layui/css/modules/layer/default/layer.css?v=3.1.1"
media="all">

<script src="/static/js/jquery.min.js"></script>
<script src="/static/layui-v2.4.5/layui.all.js"></script>
<script src="/static/layer/layer.js"></script>
<script src="${ctx}/static/editor/editormd.min.js" type="text/javascript"></script>
<style>
    ol>li{
        list-style: decimal;
    }
    ul>li{
        list-style: disc;
    }
</style>
<script type="text/javascript">
    var editor;
    $(function () {
        editor = editormd("article-editormd", {
            width: "96%",
            height: 640,
            placeholder: '你可以随意的写点什么',
            syncScrolling: "single",
            path: "${ctx}/static/editor/lib/",
            saveHTMLToTextarea: true,
            imageUpload: true,
            imageFormats: ["jpg", "jpeg", "gif", "png", "bmp"],
            imageUploadURL: "${ctx}/article/uploadImage",
            imageUploadFileName: "uploadImage",
            toolbarIcons: [
                "h1", "h2", "h3", "h4", "h5", "h6","|",
                "bold", "del", "italic", "quote","|",
                "list-ul", "list-ol", "hr","|",
                "link", "image",  "preformatted-text","table","|",
                "undo", "redo","|",
                "watch", "preview","fullscreen", "clear", "search","|",
                "help"
            ],
            dialogMaskBgColor : "#E6E6E6",//设置透明遮罩层的背景颜色，全局通用，默认为#fff


            // toolbarIconTexts : {
            //     releaseIcon : "<span bgcolor=\"gray\">发布</span>",
            //     index : "<span bgcolor=\"red\">返回首页</span>",
            // },
            // /*给自定义按钮指定回调函数*/
            // toolbarHandlers:{
            //     releaseIcon : function(cm, icon, cursor, selection) {
            //         contentCommit();//提交表单代码在下面
            //         // console.log("日志输出 testIcon =>", this, cm, icon, cursor, selection);
            //     },
            //     index : function(){
            //         window.location.href = '返回首页的路径.html';
            //     },
            // }

        });
    });

    $("#article-editormd").on('paste', function (ev) {
        var data = ev.clipboardData;
        var items = (event.clipboardData || event.originalEvent.clipboardData).items;
        for (var index in items) {
            var item = items[index];
            if (item.kind === 'file') {
                var blob = item.getAsFile();
                var reader = new FileReader();
                reader.onload = function (event) {
                    var base64 = event.target.result;
                    //ajax上传图片
                    $.post("{:url('${ctx}/article/uploadImage')}",{base:base64}, function (ret) {
                        layer.msg(ret.msg);
                        if (ret.code === 1) {
                            //新一行的图片显示
                            editor.insertValue("\n![" + ret.data.title + "](" + ret.data.path + ")");
                        }
                    });
                }; // data url!
                var url = reader.readAsDataURL(blob);
            }
        }
    });
</script>

<style>
    .title{
        border: none;
        height: 100%;
        width: 60%;
        font-size: x-large;
        font-weight: 700;
    }
</style>
<body>
<div style="position: relative">
    <form id="saveForm" class="layui-form" action="${ctx}/article/saveContent" method="post" style="padding-top: 0px">

        <div class="layui-form-item" style="width: 80%; padding-left: 2%;margin-bottom: 0px;height: 44px">
            <input  class="title" type="text" name="title" id="title"
                    placeholder="文章标题"  >

            <%--<button>文章列表</button>--%>
            <%--<button>保存</button>--%>

            <%--<button>返回首页</button>--%>

        </div>

        <div class="col-sm-12"   name="article-editormd"  id="article-editormd" >
            <textarea  name="content" id="content" style="display:none;"></textarea>
        </div>

        <div class="layui-form-item">
            <button class="layui-btn layui-btn-fluid layui-bg-black" lay-submit lay-filter="commit">发布文章</button>
        </div>

    </form>
</div>

</body>
</html>
