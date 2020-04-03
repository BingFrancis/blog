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
    <!-- Bootstrap core CSS -->
    <link href="${ctx}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .editormd-html-preview {
            width: 90%;
            margin: 0 auto;
        }

        body {
            padding-top: 56px;
        }

        .carousel-item {
            height: 65vh;
            min-height: 300px;
            background: no-repeat center center scroll;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }

        .portfolio-item {
            margin-bottom: 30px;
        }

    </style>


</head>
<body>

<div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">Post Title
        <small>by
            <a href="#">Start Bootstrap</a>
        </small>
    </h1>

    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="index.html">Home</a>
        </li>
        <li class="breadcrumb-item active">Blog Home 2</li>
    </ol>

    <div class="row">

        <div class="col-lg-8" id="test-editormd-view">
                <textarea style="display:none;" name="test-editormd-markdown-doc"></textarea>
        </div>

        <!-- Post Content Column -->
        <%--<div class="col-lg-8">--%>

            <%--<!-- Preview Image -->--%>
            <%--<img class="img-fluid rounded" src="http://placehold.it/900x300" alt="">--%>

            <%--<hr>--%>

            <%--<!-- Date/Time -->--%>
            <%--<p>Posted on January 1, 2017 at 12:00 PM</p>--%>

            <%--<hr>--%>

   <%----%>


            <%--<!-- Post Content -->--%>
            <%--<p class="lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus, vero, obcaecati, aut, error quam sapiente nemo saepe quibusdam sit excepturi nam quia corporis eligendi eos magni recusandae laborum minus inventore?</p>--%>

            <%--<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut, tenetur natus doloremque laborum quos iste ipsum rerum obcaecati impedit odit illo dolorum ab tempora nihil dicta earum fugiat. Temporibus, voluptatibus.</p>--%>

            <%--<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eos, doloribus, dolorem iusto blanditiis unde eius illum consequuntur neque dicta incidunt ullam ea hic porro optio ratione repellat perspiciatis. Enim, iure!</p>--%>

            <%--<blockquote class="blockquote">--%>
                <%--<p class="mb-0">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>--%>
                <%--<footer class="blockquote-footer">Someone famous in--%>
                    <%--<cite title="Source Title">Source Title</cite>--%>
                <%--</footer>--%>
            <%--</blockquote>--%>

            <%--<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error, nostrum, aliquid, animi, ut quas placeat totam sunt tempora commodi nihil ullam alias modi dicta saepe minima ab quo voluptatem obcaecati?</p>--%>

            <%--<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Harum, dolor quis. Sunt, ut, explicabo, aliquam tenetur ratione tempore quidem voluptates cupiditate voluptas illo saepe quaerat numquam recusandae? Qui, necessitatibus, est!</p>--%>

            <%--<hr>--%>

            <%--<!-- Comments Form -->--%>
            <%--<div class="card my-4">--%>
                <%--<h5 class="card-header">Leave a Comment:</h5>--%>
                <%--<div class="card-body">--%>
                    <%--<form>--%>
                        <%--<div class="form-group">--%>
                            <%--<textarea class="form-control" rows="3"></textarea>--%>
                        <%--</div>--%>
                        <%--<button type="submit" class="btn btn-primary">Submit</button>--%>
                    <%--</form>--%>
                <%--</div>--%>
            <%--</div>--%>

            <%--<!-- Single Comment -->--%>
            <%--<div class="media mb-4">--%>
                <%--<img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">--%>
                <%--<div class="media-body">--%>
                    <%--<h5 class="mt-0">Commenter Name</h5>--%>
                    <%--Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.--%>
                <%--</div>--%>
            <%--</div>--%>

            <%--<!-- Comment with nested comments -->--%>
            <%--<div class="media mb-4">--%>
                <%--<img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">--%>
                <%--<div class="media-body">--%>
                    <%--<h5 class="mt-0">Commenter Name</h5>--%>
                    <%--Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.--%>

                    <%--<div class="media mt-4">--%>
                        <%--<img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">--%>
                        <%--<div class="media-body">--%>
                            <%--<h5 class="mt-0">Commenter Name</h5>--%>
                            <%--Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.--%>
                        <%--</div>--%>
                    <%--</div>--%>

                    <%--<div class="media mt-4">--%>
                        <%--<img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">--%>
                        <%--<div class="media-body">--%>
                            <%--<h5 class="mt-0">Commenter Name</h5>--%>
                            <%--Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.--%>
                        <%--</div>--%>
                    <%--</div>--%>

                <%--</div>--%>
            <%--</div>--%>

        <%--</div>--%>

        <!-- Sidebar Widgets Column -->
        <div class="col-md-4">

            <!-- Search Widget -->
            <div class="card mb-4">
                <h5 class="card-header">Search</h5>
                <div class="card-body">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search for...">
                        <span class="input-group-btn">
                <button class="btn btn-secondary" type="button">Go!</button>
              </span>
                    </div>
                </div>
            </div>

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
                    You can put anything you want inside of these side widgets. They are easy to use, and feature the new Bootstrap 4 card containers!
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
