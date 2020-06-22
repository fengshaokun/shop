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
      </div>
      <div class="swiper-slide slide2">
        <div class="inner">
          <img src="assets/images/words2.png" class="ani img1" swiper-animate-effect="fadeInLeft"
            swiper-animate-duration="2s" swiper-animate-delay="0.5s">
        </div>
      </div>
      <div class="swiper-slide slide3">
      </div>
      <div class="swiper-slide slide4">
        <div class="inner">
          <div class="banner-text ani" swiper-animate-effect="fadeInUp" swiper-animate-duration="2s"
            swiper-animate-delay="0.5s">
            <h3><em>[ 限时免费 ]</em></h3>
            <h2>专属云<em>0元试用</em></h2>
            <p>专家团1V1量身定制，打造您的云上专属头等舱</p>
            <span class="btn-primary" href="javascript:">免费申请</span>
          </div>
          <img src="assets/images/image-main4-r.png" class="ani img1" swiper-animate-effect="fadeInUp"
            swiper-animate-duration="1s" swiper-animate-delay="0.5s">
          <img src="assets/images/image-sub4-r2.png" class="ani img2" swiper-animate-effect="fadeInDown"
            swiper-animate-duration="2s" swiper-animate-delay="0.5s">
        </div>
      </div>
      <div class="swiper-slide slide5">
        <div class="inner">
          <div class="banner-text ani" swiper-animate-effect="fadeInUp" swiper-animate-duration="2s"
            swiper-animate-delay="0.5s">
            <h3><em>[ 限时免费 ]</em></h3>
            <h2>专属云<em>0元试用</em></h2>
            <p>专家团1V1量身定制，打造您的云上专属头等舱</p>
            <span class="btn-primary" href="javascript:">免费申请</span>
          </div>
          <img src="assets/images/image-main5-r.png" class="ani img1" swiper-animate-effect="fadeInRight"
            swiper-animate-duration="1s" swiper-animate-delay="0.5s">
          <img src="assets/images/image-sub5-r2.png" class="ani img2" swiper-animate-effect="fadeInDown"
            swiper-animate-duration="2s" swiper-animate-delay="0.5s">
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
<jsp:include page="footer.jsp"/>
<jsp:include page="homeBottom.jsp"/>
<jsp:include page="consult.jsp"/>
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