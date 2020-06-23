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
    <div class="main-container mainBody" >
      <div >
    <p style="font-size: 20px ;padding-left: 100px">无搜索产品...</p>
      </div>
      <input  id="searchParam" type="text"  value="${name}"  style="display: none;">
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
  <script>
     var val = $('#searchParam').val();
      console.log(${name})
      $('#param').val(${name});
  </script>
  </body>
</html>
