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
    <meta name="menu" content="index"/>

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
                                            <a href="/product/index">已发布产品</a>
                                        </li>
                                        <li class="fl status-btn-each">
                                            <a href="/product/index?status=2">已删除产品</a>
                                        </li>
                                    </ul>
                                </div>

                                <table class="table table-bordered table-striped">
                                    <tr>
                                        <th>公司名称</th>
                                        <th>公司简介</th>
                                        <th>客户LOGO</th>
                                        <th>背景图</th>
                                        <th>案例名称</th>
                                        <th>案例介绍</th>
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
                                            <td class="text-center">${itemDto.createTime.toLocaleString()}</td>
                                            <td class="text-center">${itemDto.cProductDetails.productContent}</td>
                                            <td class="text-center" width="60">

                                                <c:if test="${itemDto.status==2}">
                                                    <a href="/product/updateStatus?id=${itemDto.id}&status=2" onclick="return confirm('确定将此记录恢复?')"  class="delete-good" >恢复</a>
                                                </c:if>
                                                <c:if test="${itemDto.status==1}">
                                                    <a href="/product/update?id=${itemDto.id}"   class="delete-good" >修改</a>
                                                    <a href="/product/updateStatus?id=${itemDto.id}&status=1" onclick="return confirm('确定将此记录删除?')"  class="delete-good" >删除</a>
                                                </c:if>
                                            </td>
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


</div>

</body>
</html>