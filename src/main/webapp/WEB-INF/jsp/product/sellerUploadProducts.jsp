<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <title>发布货品</title>
    <meta name="menu" content="toSellerUploadProducts"/>
    <%-- 页面头部样式开始----------------------------------------------------------%>
    <jsp:include page="/decorator/sellerHead.jsp"/>
    <%-- 页面头部样式结束---------------------------------------------------------%>
</head>
<body>
<div class="main">
    <%--上边菜单开始-------------------------------------------------------------%>
    <jsp:include page="/decorator/sellerTopMenu.jsp"/>
    <%--上边菜单结束-------------------------------------------------------------%>


    <%--正文开始-----------------------------------------------------------------%>
    <div class="perscenter-ui">
        <div class="main-layout">
            <div class="wrapper">
                <div class="content-layout">

                    <%--左边菜单开始-----------------------------------------------------%>
                    <jsp:include page="/decorator/sellerLeftMenu.jsp"/>
                    <%--左边菜单结束-----------------------------------------------------%>

                        <div class="form-horizontal editgoods grey edit-goods-new distProduct">
                            <h2>商品基本信息</h2>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">货品名称：</label>
                                <div class="col-sm-6">
                                    <input class="filter-input-filed form-control" id="prodName" placeholder="请输入货品" type="text">
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-sm-2 control-label">货品描述：</label>
                                <div class="col-sm-6">
                                    <textarea id="editor" type="text/plain" style="width:664px;height:500px;"></textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label"></label>
                                <div class="col-sm-6">
                                    <button class="btn btn-primary btn-lg" type="submit" onclick="getContent()">提交</button>
                                </div>
                            </div>

                        </div>





                        <script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.config.js"></script>
                        <script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.all.js"></script>
                        <script type="text/javascript" charset="utf-8" src="/ueditor/lang/zh-cn/zh-cn.js"></script>
                        <script type="text/javascript" src="/js/fwb.js"></script>

                </div>
            </div>
        </div>
        <%--正文结束-----------------------------------------------------------------%>

    </div>


    <%--页脚开始   -------------------------------------------------------------------%>
    <jsp:include page="/decorator/footer.jsp"/>
    <%--页脚结束   -------------------------------------------------------------------%>

    <%-- 底部js开始 --%>
    <jsp:include page="/decorator/sellerBottom.jsp"/>
    <%-- 底部js结束 --%>


</body>


</html>