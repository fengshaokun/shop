    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        <!DOCTYPE html>
        <html>

        <head>
        <title>创建菜单</title>
        <%-- 页面头部样式开始----------------------------------------------------------%>
        <jsp:include page="/decorator/sellerHead.jsp"/>
        <%-- 页面头部样式结束---------------------------------------------------------%>
        <meta name="menu" content="toGoodsManagement"/>

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
        <h2>创建菜单</h2>

        <div class="form-group">
        <label class="col-sm-2 control-label">货品名称：</label>
        <div class="col-sm-6">
        <input class="filter-input-filed form-control" id="prodName" placeholder="请输入货品" type="text">
        </div>
        </div>




        <div class="form-group">
        <label class="col-sm-2 control-label"></label>
        <div class="col-sm-6">
        <button class="btn btn-primary btn-lg" type="submit" onclick="getContent()">提交</button>
        </div>
        </div>

        </div>







        </div>
        </div>
        </div>
        <%--正文结束-----------------------------------------------------------------%>

        </div>

</html>
