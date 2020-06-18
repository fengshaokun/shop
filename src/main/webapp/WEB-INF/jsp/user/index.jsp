<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
    <title>客户咨询管理</title>
    <%-- 页面头部样式开始----------------------------------------------------------%>
    <jsp:include page="/decorator/sellerHead.jsp"/>
    <%-- 页面头部样式结束---------------------------------------------------------%>
    <meta name="user" content="index"/>

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
                                        <a href="/consult/exportExcel">导出excel</a>
                                    </li>
                                </ul>
                            </div>
                            <table class="table table-bordered table-striped">
                                <tr>
                                    <th>序号</th>
                                    <th>姓名</th>
                                    <th>电话</th>
                                    <th>邮箱</th>
                                    <th>公司</th>
                                    <th>咨询内容</th>
                                    <th>咨询时间</th>
                                    <th>操作</th>
                                </tr>
                                <c:forEach items="${pageInfo.list}" var="itemDto" varStatus="status">
                                    <tr>
                                        <td class="text-center">${status.index + 1}</td>
                                        <td class="text-center">${itemDto.name}</td>
                                        <td class="text-center">${itemDto.tel}</td>
                                        <td class="text-center">${itemDto.email}</td>
                                        <td class="text-center">${itemDto.company}</td>
                                        <td class="text-center">${itemDto.content}</td>
                                        <td class="text-center">${itemDto.createTime.toLocaleString()}</td>
                                        <td class="text-center" width="70">
                                            <a href="/consult/update?id=${itemDto.id}" class="delete-good" >修改</a>
                                            <a href="/consult/delete?id=${itemDto.id}" onclick="return confirm('确定将此记录删除?')"   class="delete-good" >删除</a>
                                        </td>
                                    </tr>
                                </c:forEach>

                            </table>
                            <%--分页--%>
                            <script type="text/javascript">
                                var if_firstime = true;


                                window.onload = function () {
                                    $('.pagination').jqPaginator({
                                        totalPages: ${pageInfo.pages},
                                        visiblePages: 10,
                                        currentPage: ${pageInfo.pageNum},

                                        first: '<li class="first"><a href="javascript:void(0);">第一页</a></li>',
                                        prev: '<li class="prev"><a href="javascript:void(0);">上一页</a></li>',
                                        next: '<li class="next"><a href="javascript:void(0);">下一页</a></li>',
                                        last: '<li class="last"><a href="javascript:void(0);">最末页 </a></li>',
                                        page: '<li class="page"><a href="javascript:void(0);">{{page}}</a></li>',

                                        onPageChange: function (num) {
                                            if (if_firstime) {
                                                if_firstime = false;
                                            } else if (!if_firstime) {
                                                changePage(num);
                                            }

                                        }
                                    });
                                }
                                function changePage(num) {

                                    location.href="/consult/index?&pageNum=" + num;
                                }
                            </script>
                            <div class="pagination-layout">
                                <div class="pagination">
                                    <ul class="pagination" total-items="pageInfo.totalRows" max-size="10" boundary-links="true">

                                    </ul>
                                </div>
                            </div>
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