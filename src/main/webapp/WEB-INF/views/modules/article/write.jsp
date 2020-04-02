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
            width: "90%",
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
                "undo", "redo", "|",
                "bold", "del", "italic", "quote", "|",
                "h1", "h2", "h3", "h4", "h5", "h6", "|",
                "list-ul", "list-ol", "hr", "|",
                "link", "image",  "preformatted-text","table", "|",
                "watch", "preview", "clear", "search",
                "|","help"
            ],
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

    function contentCommit(){
        mdEditorForm.method = "post";
        mdEditorForm.action = "${ctx}/article/saveContent";//提交至服务器的路径
        mdEditorForm.submit();
    }

    // $(function(){
    //     $(".editor-preview-container").find("img").each(function(){
    //         $(this).attr("src", "data:image/jpeg;base64," + decode64($(this).context.src));
    //         $(this).css("width", "65%");
    //         $(this).css("height", "65%");
    //         $(this).wrap("<div align='center'></div>");
    //     });
    // });

    function decode64(imgUrl){
        $.ajax({
            type: 'post',
            url: "${ctx}/article/getImage",
            dataType: "json",
            async: false,
            data : {
                urls : imgUrl,
            },
            success: function (result) {
                imgUrl = result.resImg;
            },
            error: function () {
                console.log("error!");
            }
        });
        return imgUrl;
    }
</script>
<body>
<div class="form-group">
    <form id="saveForm" class="layui-form" action="${ctx}/article/saveContent" method="post">
        <input type="text" name="title" id="title"
               placeholder="文章标题"  style="width: auto;text-align: center">
        <div class="col-sm-12"   name="article-editormd"  id="article-editormd" >
            <textarea  name="content" id="content" style="display:none;"></textarea>
        </div>
        <div class="layui-form-item">
            <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="commit">发布文章</button>
        </div>
    </form>

</div>

</body>
</html>
