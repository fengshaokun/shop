<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>倍速世纪产品网页</title>
  <%-- 页面头部样式开始----------------------------------------------------------%>
  <jsp:include page="homeHead.jsp"/>
  <%-- 页面头部样式结束---------------------------------------------------------%>
</head>

<body>
<jsp:include page="homeTopMenu.jsp"/>

  <!-- banner -->
  <div class="swiper-container">
    <div class="swiper-wrapper">
      <div class="swiper-slide slide1">
        <img src="assets/images/bg-pc4.jpg" alt="">
        <div class="inner">
          <div class="banner-text ani" swiper-animate-effect="fadeInUp" swiper-animate-duration="2s"
               swiper-animate-delay="0.5s">
            <h3><em>设备图形及UI定制</em></h3>
            <p>设备自适应，图形化控制、事件管理、能效管理、设施管理、策略日历、WEB应用</p>
          </div>
          <img src="assets/images/bg1.png" class="ani img2" swiper-animate-effect="fadeInDown"
               swiper-animate-duration="2s" swiper-animate-delay="0.5s">
        </div>
      </div>
      <div class="swiper-slide slide2">
        <div class="inner">
          <div class="banner-text ani" swiper-animate-effect="fadeInUp" swiper-animate-duration="2s"
               swiper-animate-delay="0.5s">
            <h3><em>能效管理</em></h3>
            <p>设备自适应，图形化控制、事件管理、能效管理、设施管理、策略日历、WEB应用</p>
          </div>
          <img src="assets/images/bg2.png" class="ani img2" swiper-animate-effect="fadeInDown"
               swiper-animate-duration="2s" swiper-animate-delay="0.5s">
        </div>
      </div>
      <div class="swiper-slide slide3">
        <div class="inner">
          <div class="banner-text ani" swiper-animate-effect="fadeInUp" swiper-animate-duration="2s"
            swiper-animate-delay="0.5s">
            <h3><em>系统集成解决方案</em></h3>
            <p>软件集成了多种楼宇常用的协议标准，包括OBIX、OPC、BACNet、Lonworks、M-Bus、KNX等多种标准协议，以及多厂商楼宇自控系统的私有协议</p>
          </div>
          <img src="assets/images/bg3.png" class="ani img1" swiper-animate-effect="fadeInRight"
            swiper-animate-duration="1s" swiper-animate-delay="0.5s">
        </div>
      </div>
    </div>
    <div class="paginationB"></div>

  </div>


  <!-- 业务体系 -->

  <c:forEach items="${homepages}" var="itemDto">
  <div class="business">
    <img src="${itemDto.src}" alt="">
  </div>
  </c:forEach>

  <!-- 案例展示 -->
  <div class="caseShow">
    <div class="caseTitle">
      <h4>案例展示</h4>
      <p>- CASE SHOW -</p>
    </div>
    <!-- 案例内容 -->
    <div class="caseContent">
      <c:forEach items="${cases}" var="itemDto">
      <div class="item">
        <img src="${itemDto.backgroundImage}" alt="">
        <div class="itemText">
          <h4>${itemDto.name}</h4>
          <p>${itemDto.companyIntroduct}</p>
          <a href="/home/caseDetails?id=${itemDto.id}" target="_blank">MORE..</a>
        </div>
      </div>
      </c:forEach>
    </div>
    <!-- 查看更多 -->
    <div class="checkMore">
      <a href="/home/caseShow" target="_self">查看更多 +</a>
    </div>
  </div>
<jsp:include page="homeBottom.jsp"/>
<jsp:include page="footer.jsp"/>
  <script>
    var mySwiper = new Swiper('.swiper-container', {
      pagination: '.paginationB',
      paginationClickable: true,
      autoplay: 3000,
      speed: 1,
      loop: true,

      onInit: function (swiper) {
        swiperAnimateCache(swiper); //隐藏动画元素 
        swiperAnimate(swiper); //初始化完成开始动画
      },
      onSlideChangeEnd: function (swiper) {
        swiperAnimate(swiper); //每个slide切换结束时也运行当前slide动画
      }
    })
  </script>
  <script>
    $('.caseContent .item').on({
      "mouseenter": function () {
        $(this).find('.itemText').stop(true).animate({
          bottom: 0
        }, 300)
      },
      "mouseleave": function () {
        $(this).find('.itemText').stop(true).animate({
          bottom: "-90px"
        }, 300)
      },

    })
  </script>


</body>

</html>