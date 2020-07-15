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
<div class="mainBody">
    <div class="component-specs-content__redmi-xai">
        ${details.cProductDetails.productContent}
    </div>

    <c:if test="${itemDto.video!=null}">
        <div class="playright">
            <div class="playbtn">
                <img src="/home/assets/images/playon.png" alt="" />
            </div>
            <div class="playon">播放视频</div>
        </div>
        <div class="video">
            <div class="videodiv">
                <span class="close"></span>
                <video
                        id="videoId"
                        autoplay="autoplay"
                        loop="loop"
                        width="700"
                        height="500"
                        controls="controls"
                        muted="muted"
                >
                    <source
                            autoplay="autoplay"
                            src="${details.video}"
                            type="video/mp4"
                    />
                </video>
            </div>
        </div>
    </c:if>

</div>
<jsp:include page="homeBottom.jsp"/>
<jsp:include page="footer.jsp"/>
<jsp:include page="consult.jsp"/>
    <script src="assets/js/jquery-3.1.1.min.js"></script>
    <script>
      $(".playright").on("click", function () {
        $(".video").show();
      });

      $(".playright").mouseenter(function () {
          $(this).animate({
                    right: 0,
                  });
      })

      $(".playright").mouseleave(function () {
          $(this).animate({
              right: -100
          });
      })

      // $(".playright").hover(
      //   function () {
      //     $(this).animate({
      //       right: 0,
      //     });
      //   },
      //   function () {
      //     $(this).animate({
      //       right: -100,
      //     });
      //   }
      // );

      $(".close").on("click", function () {
        $(".video").hide();
      });
    </script>
  </body>
</html>
