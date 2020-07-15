<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>倍速世纪案例详情</title>
    <%-- 页面头部样式开始----------------------------------------------------------%>
    <jsp:include page="homeHead.jsp"/>
    <%-- 页面头部样式结束---------------------------------------------------------%>
</head>

<body>
<jsp:include page="homeTopMenu.jsp"/>
<div style="align-content: center" class="mainBody">
${details.content}
</div>
<jsp:include page="homeBottom.jsp"/>
<jsp:include page="footer.jsp"/>

</body>
</html>
