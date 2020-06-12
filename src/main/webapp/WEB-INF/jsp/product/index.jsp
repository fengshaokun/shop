<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
    <title>商品管理</title>
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

                        <div>
                            <div class="bg_color percent-seller percent-seller-goods" id="searchCondition">
                                <div class="goods-status">
                                    <ul class="status-btn">
                                        <li class="fl status-btn-each">
                                            <a href="/seller/toGoodsManagement?searchFlag=1">全部产品</a>
                                        </li>
                                        <li class="fl status-btn-each">
                                            <a href="/seller/toGoodsManagement?searchFlag=2">待上架产品</a>
                                        </li>
                                        <li class="fl status-btn-each">
                                            <a href="/seller/toGoodsManagement?searchFlag=3">已上架产品</a>
                                        </li>
                                        <li class="fl status-btn-each">
                                            <a href="/seller/toGoodsManagement?searchFlag=4">已下架产品</a>
                                        </li>
                                        <li class="fl status-btn-each">
                                            <a href="/seller/toGoodsManagement?searchFlag=6">已删除产品</a>
                                        </li>
                                    </ul>
                                </div>

                                <table class="table table-bordered table-striped">
                                    <tr>
                                        <th>产品名称</th>
                                        <th>产品图标</th>
                                        <th>产品标签</th>
                                        <th>背景图片</th>
                                        <th>产品简介</th>
                                        <th>是否热卖</th>
                                        <th>是否新品</th>
                                        <th>上传时间</th>
                                        <th>产品详情</th>
                                        <th>操作</th>
                                    </tr>
                                    <c:forEach items="${productList}" var="itemDto">
                                        <tr>
                                            <td class="text-center">${itemDto.name}</td>
                                            <td>
                                                <img width="54" height="54" src=" ${ fn:split(itemDto.icon, ',')[0] } "
                                                     style="float: left;">
                                            </td>
                                            <td class="text-center">${itemDto.tag}</td>
                                            <td>
                                                <img width="54" height="54" src=" ${ fn:split(itemDto.background, ',')[0] } "
                                                     style="float: left;">
                                            </td>
                                            <td class="text-center">${itemDto.briefIntroduction}</td>
                                            <td class="text-center">
                                                    <c:if test="${itemDto.isHot==0}">否</c:if>
                                                    <c:if test="${itemDto.isHot==1}">是</c:if>
                                                    </td>
                                            <td class="text-center">
                                                <c:if test="${itemDto.isNew==0}">否</c:if>
                                                <c:if test="${itemDto.isNew==1}">是</c:if></td>
                                            <td class="text-center">${itemDto.createTime.toLocaleString()}</td>
                                            <td class="text-center">${itemDto.cProductDetails.productContent}</td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
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