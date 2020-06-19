<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
    <title>案例管理</title>
    <%-- 页面头部样式开始----------------------------------------------------------%>
    <jsp:include page="/decorator/sellerHead.jsp"/>
    <%-- 页面头部样式结束---------------------------------------------------------%>
    <meta name="case" content="index"/>

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
                                    <th>名称</th>
                                    <th>底部左边内容</th>
                                    <th>底部右边内容</th>
                                </tr>
                                <c:forEach items="${foots}" var="itemDto">
                                    <tr>
                                        <td class="text-center">${itemDto.id}</td>
                                        <td class="text-center">${itemDto.name}</td>
                                        <td class="text-center">
                                            <textarea name=""  cols="30" rows="10">
                                                    ${itemDto.leftText}
                                            </textarea>
                                        </td>
                                        <td class="text-center">
                                            <textarea name=""  cols="30" rows="10">
                                                    ${itemDto.rightText}
                                            </textarea>
                                        </td>

                                        <td class="text-center" width="70">
                                            <a href="/homepage/toFoot?id=${itemDto.id}"    class="delete-good" >修改</a>
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