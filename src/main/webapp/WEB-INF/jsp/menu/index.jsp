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
		<th>菜单名</th>
		<th>图标</th>
		<th>上一级</th>
		<th>操作</th>
		</tr>
		<c:forEach items="${pageInfo.list}" var="itemDto">
			<tr>
			<td class="text-center"><fmt:formatNumber value="${itemDto.price/100}"
													  type="CURRENCY"></fmt:formatNumber></td>
			</td>
			<td class="text-center">${itemDto.stock}</td>
			<td class="text-center">${itemDto.onTime.toLocaleString()}</td>
			<td class="text-center"><a href="/seller/xiajia?itemId=${itemDto.id}" class="delete-good">下架</a>
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
