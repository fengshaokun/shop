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
		<div class="bg_color percent-seller percent-seller-goods" id="searchCondition">
		<table class="table table-bordered table-striped">
		<tr>
		<th>id</th>
		<th>主标题</th>
		<th>副标题</th>
		<th>Url</th>
		<th>排序</th>
		<th>上一级菜单</th>
		<th>操作</th>
		</tr>
		<c:forEach items="${menus}" var="itemDto">
			<tr>
			<td class="text-center">${itemDto.id}</td>
			<td class="text-center">${itemDto.principal}</td>
			<td class="text-center">${itemDto.subordinate}</td>
			<td class="text-center">${itemDto.url}</td>
			<td class="text-center">${itemDto.sort}</td>
			<td class="text-center">${itemDto.pid}</td>
			</td>
			</tr>
		</c:forEach>
		</table>

		</div>

		</div>
		</div>
		</div>
		</div>
		</div>


		<%--页脚开始   -------------------------------------------------------------------%>
		<jsp:include page="/decorator/footer.jsp"/>
		<%--页脚结束   -------------------------------------------------------------------%>

		<%-- 底部js开始 --%>
		<jsp:include page="/decorator/sellerBottom.jsp"/>
		<%-- 底部js结束 --%>
		</body>


</html>
