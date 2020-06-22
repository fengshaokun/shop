<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>倍速世纪产品列表</title>
  <%-- 页面头部样式开始----------------------------------------------------------%>
  <jsp:include page="homeHead.jsp"/>
  <%-- 页面头部样式结束---------------------------------------------------------%>
</head>

  <body>
  <jsp:include page="homeTopMenu.jsp"/>
    <div class="main-container">

      <div class="list">
        <ul>
<c:forEach items="${pageInfo.list}" var="itemDto">
          <li class="listli">
            <div class="tipimg">
              <c:if test="${itemDto.isNew==1}">
                <img src="/home/assets/images/new.png" alt="">
              </c:if>
              <c:if test="${itemDto.isHot==1}">
                <img src="/home/assets/images/hot.png" alt="">
              </c:if>
            </div>
            <div class="imgBox">
              <img src="${itemDto.icon}" alt="" />
            </div>
            <div class="mask">
              <img class="play" src="/home/assets/images/play.png" alt="" />
            </div>
            <div class="video">
              <div class="videodiv">
                <span class="close"></span>
                <video
                  width="520"
                  height="340"
                  controls="controls"
                  muted="muted"
                  autoplay="autoplay"
                  loop="loop"
                >
                  <source src="${itemDto.video}" type="video/mp4" />
                </video>
              </div>
            </div>
            <a href="/home/productDetails?id=${itemDto.id}" target="_blank">
              <div class="listdetail">
                <div class="detailtt">${itemDto.name}</div>
                <div class="detaillabel">
                  <!-- <div class="labeltt">产品标签</div> -->
                  <ul>
                    <li>${itemDto.tag}</li>
                <%--    <li>可配置的无线模式</li>
                    <li>有电池</li>--%>
                  </ul>
                </div>
                <div class="detailinstruction">
                    ${itemDto.briefIntroduction}
                </div>
              </div>
            </a>
          </li>
</c:forEach>
        </ul>
      </div>
      <input  id="searchParam" type="text"  value="${searchParam}"  style="display: none;">
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
                var paramVal = $('#searchParam').val();
                $('#param').val(paramVal);
                changePage(num,paramVal);
              }

            }
          });
        }
        function changePage(num,paramVal) {

          location.href="/home/list?&pageNum=" + num+"&name="+paramVal;
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
    <script>
      $(".mask").on("click", function () {
        var hasvideo = $(this).parents(".listli").has(".video");
        if (hasvideo) {
          $(this).parents(".listli").find(".video").show();
          $(this).parents(".listli").find(".video");
        }
      });
      $(".close").on("click", function () {
        $(".video").hide();
      });
    </script>
  </body>
</html>
