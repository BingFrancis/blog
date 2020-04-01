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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>HTML Preview(markdown to html) - Editor.md examples</title>
    <link rel="stylesheet" href="${ctx}/static/editor/css/editormd.preview.css" />
    <style>
        .editormd-html-preview {
            width: 90%;
            margin: 0 auto;
        }
    </style>
</head>
<body>
<div id="layout">
    <header>
        <h1>Markdown转HTML的显示处理</h1>
    </header>
    <div id="test-editormd-view">
        <textarea style="display:none;" name="test-editormd-markdown-doc"></textarea>
    </div>
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
    $(function() {
        var testEditormdView, testEditormdView2;

        $.get("getContent", function(markdown) {

            testEditormdView = editormd.markdownToHTML("test-editormd-view", {
                markdown        : markdown ,//+ "\r\n" + $("#append-test").text(),
                //htmlDecode      : true,       // 开启 HTML 标签解析，为了安全性，默认不开启
                htmlDecode      : "style,script,iframe",  // you can filter tags decode
                //toc             : false,
                tocm            : true,    // Using [TOCM]
                //tocContainer    : "#custom-toc-container", // 自定义 ToC 容器层
                //gfm             : false,
                //tocDropdown     : true,
                // markdownSourceCode : true, // 是否保留 Markdown 源码，即是否删除保存源码的 Textarea 标签
                emoji           : true,
                taskList        : true,
                tex             : true,  // 默认不解析
                flowChart       : true,  // 默认不解析
                sequenceDiagram : true,  // 默认不解析
            });

            //console.log("返回一个 jQuery 实例 =>", testEditormdView);

            // 获取Markdown源码
            //console.log(testEditormdView.getMarkdown());

            //alert(testEditormdView.getMarkdown());
        });

        testEditormdView2 = editormd.markdownToHTML("test-editormd-view2", {
            htmlDecode      : "style,script,iframe",  // you can filter tags decode
            emoji           : true,
            taskList        : true,
            tex             : true,  // 默认不解析
            flowChart       : true,  // 默认不解析
            sequenceDiagram : true,  // 默认不解析
        });
    });
</script>
</body>
</html>
