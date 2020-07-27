<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
    <div class="main-container mainBody" >

      <c:forEach items="${map}" var="map" >

      <div class="category-list container">
        <div class="box-hd J_box-hd" id=" >
          <h2 class="title">
            <i class="glyphicon glyphicon-menu-down"></i>
              ${map.key}
          </h2>
        </div>
        <div class="list J_box-bd">
          <ul>
            <c:forEach items="${map.value}" var="itemDto">
              <li class="listli">
                <a href="/home/productDetails?id=${itemDto.id}" target="_blank">
                <div class="tipimg">
                  <c:if test="${itemDto.isNew==0}">
                    <img class="tipimg1" src="/home/assets/images/new.png" alt="">
                  </c:if>
                  <c:if test="${itemDto.isHot==0}">
                    <img class="tipimg2" src="/home/assets/images/hot.png" alt="">
                  </c:if>
                </div>
                <div class="imgBox">
                  <img src="${itemDto.icon==null ||itemDto.icon =='' ? 'assets/images/zanwu.png':itemDto.icon}" alt="" />
                </div>
                  <div class="listdetail">
                    <div class="detailtt">${itemDto.name}</div>
                    <div class="detaillabel">
                      <ul>
                        <li>${itemDto.tag}</li>
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
      </div>
      </c:forEach>
      <input  id="searchParam" type="text"  value="${searchParam}"  style="display: none;">
    </div>
  <jsp:include page="homeBottom.jsp"/>

    <jsp:include page="footer.jsp"/>

  <script>
      var val = $('#searchParam').val();
      $('#param').val(val);

      $(".J_box-hd").on("click", function () {
        var $bd = $(this).siblings(".J_box-bd");
        var $icon = $(this).find("i.glyphicon");

        if ($bd.is(":visible")) {
          $bd.hide();
          $icon.addClass("glyphicon-menu-up");
        } else {
          $bd.fadeIn();
          $icon.removeClass("glyphicon-menu-up");
        }
      });
  </script>
  </body>
</html>
