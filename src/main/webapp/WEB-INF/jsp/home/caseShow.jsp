<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>


<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>案例</title>
  <%-- 页面头部样式开始----------------------------------------------------------%>
  <jsp:include page="homeHead.jsp"/>
  <%-- 页面头部样式结束---------------------------------------------------------%>
</head>

<body>


<!-- 顶部导航 -->
<jsp:include page="homeTopMenu.jsp"/>
  <!-- 主体 -->
  <div class="main">
    <!-- banner图 -->
    <div class="bannerImg">
      <img src="${cHomePage.src}" alt="">
    </div>
    <!-- 内容 -->
    <div class="mainContent">
      <!-- 顶部 -->
      <div class="topNav">
        <div>
          <i></i>
          <span class="text">您当前的位置:</span>
          <a href="/home/index">首页</a>
          <span> >> </span>
          <a href="javascript:;">案例展示</a>
        </div>
      </div>
      <!-- 内容主体 -->
      <div class="mainBodyContent">
        <div class="title">
          <h4>倍速世纪案例展示</h4>
          <p>-CASE SHOW-</p>
        </div>
        <div class="itemGroup">
          <c:forEach items="${pageInfo.list}" var="itemDto">
          <div class="item">
            <img src="${itemDto.backgroundImage}" alt="">
            <h4>${itemDto.name}</h4>
            <p>${itemDto.companyIntroduct}</p>
            <a href="/home/caseDetails?id=${itemDto.id}" target="_blank">MORE..</a>
          </div>
          </c:forEach>
        </div>
      </div>
    </div>

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
        location.href="/home/caseShow?&pageNum=" + num;
      }
    </script>
    <div class="pagination-layout" style="text-align: center">
      <div class="pagination">
        <ul class="pagination" total-items="pageInfo.totalRows" max-size="10" boundary-links="true">

        </ul>
      </div>
    </div>
  </div>
<jsp:include page="footer.jsp"/>
<jsp:include page="homeBottom.jsp"/>
</body>

</html>