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
<script src="${ctx}/static/jquery/jquery-1.9.1.min.js"></script>
<script src="${ctx}/static/editor/editormd.min.js" type="text/javascript"></script>

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
                "link", "image", "code", "preformatted-text", "code-block", "table", "html-entities", "|",
                "watch", "preview", "clear", "search",
                "|","help"
            ],
        });
    });

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
    <from>
        <input type="text" name="title" id="title" lay-verify="cellphone"
               placeholder="文章标题"  style="width: auto;text-align: center">
        <div class="col-sm-12" id="article-editormd">
            <textarea style="display:none;"></textarea>
        </div>
        <input type="button" value="发布文章">
        
    </from>

</div>

</body>
</html>
