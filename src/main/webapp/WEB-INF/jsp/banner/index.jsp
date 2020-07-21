<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
    <title>首页管理</title>
    <%-- 页面头部样式开始----------------------------------------------------------%>
    <jsp:include page="/decorator/sellerHead.jsp"/>
    <%-- 页面头部样式结束---------------------------------------------------------%>
    <meta name="homepage" content="index"/>

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
                                <table class="table table-bordered table-striped">
                                    <tr>
                                        <th>序号</th>
                                        <th>标题</th>
                                        <th>副标题</th>
                                        <th>图片</th>
                                        <th>操作</th>
                                    </tr>
                                    <c:forEach items="${list}" var="itemDto">
                                        <tr>
                                            <td class="text-center">${itemDto.id}</td>
                                            <td class="text-center">${itemDto.title}</td>
                                            <td class="text-center">${itemDto.subtitle}</td>
                                            <td>
                                                <img width="54" height="54"
                                                     src=" ${ fn:split(itemDto.image, ',')[0] } "
                                                     style="float: left;">
                                            </td>

                                            <td class="text-center" width="70">
                                                    <a href="/banner/update?id=${itemDto.id}"    class="delete-good" >修改</a>
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