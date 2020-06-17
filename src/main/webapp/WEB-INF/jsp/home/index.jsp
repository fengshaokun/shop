<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>


<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Document</title>
  <%-- 页面头部样式开始----------------------------------------------------------%>
  <jsp:include page="homeHead.jsp"/>
  <%-- 页面头部样式结束---------------------------------------------------------%>
</head>

<body>
<jsp:include page="homeTopMenu.jsp"/>
<%--  <!-- 顶部导航 -->
  <div class="header">

    <!-- 列表 -->
    <ul>
      <!-- logo -->
      <li class="headerli">
        <div class="logo">
          <img src="./assets/images/logo.png" alt="">
        </div>
      </li>
      <li class="headerli">
        <span>首页</span>
        <!-- <span class="arrow"></span> -->
      </li>
      <li class="headerli headerli_case">
        <span>产品</span>
        <span class="arrow"></span>

      </li>
      <li class="headerli">
        <span>案例</span>
        <!-- <span class="arrow"></span> -->
      </li>
      <li class="headerli">
        <input type="text" placeholder="搜索...">
        <span></span>
      </li>
    </ul>
    <!-- 下拉 -->
    <div class="dropdown case">
      <div>
        <ul class="left_ul">
          <li data-to="1" class="right_li_hover">
            <span>硬件</span>
          </li>
          <li data-to="2" class="">
            <span>系统</span>
          </li>
          <li data-to="3" class="">
            <span>niagara驱动</span>
          </li>
        </ul>
        <div class="dropdownNav dropdownNav1">
          <ul class="right_ul">
            <li>
              <img src="./assets/images/bot_1.png" alt="">
              <p>采集控制</p>
              <p>xxx</p>
              <!-- <a href="">采集控制</a> -->
            </li>
            <li>
              <img src="./assets/images/bot_1.png" alt="">
              <p>物联网中间件</p>
              <p>xxx</p>
              <!-- <a href="">物联网中间件</a> -->
            </li>
            <li>
              <img src="./assets/images/bot_1.png" alt="">
              <p>传感器|计量装置</p>
              <p>xxx</p>
              <!-- <a href="">传感器|计量装置</a> -->
            </li>
          </ul>
        </div>
        <div class="dropdownNav dropdownNav2">
          <ul class="right_ul">
            <li>
              <img src="./assets/images/bot_1.png" alt="">
              <p>楼宇</p>
              <p>xxx</p>
              <!-- <a href="">楼宇</a> -->
            </li>
            <li>
              <img src="./assets/images/bot_1.png" alt="">
              <p>工业</p>
              <p>xxx</p>
              <!-- <a href="">工业</a> -->
            </li>
            <li>
              <img src="./assets/images/bot_1.png" alt="">
              <p>产品</p>
              <p>xxx</p>
              <!-- <a href="">产品</a> -->
            </li>
          </ul>
        </div>
        <div class="dropdownNav dropdownNav3">
          <ul class="right_ul">
            <li>
              <img src="./assets/images/bot_1.png" alt="">
              <p>niagara驱动</p>
              <p>xxx</p>
              <!-- <a href="">niagara驱动</a> -->
            </li>
            <li>
              <img src="./assets/images/bot_1.png" alt="">
              <p>niagara模块</p>
              <p>xxx</p>
              <!-- <a href="">niagara模块</a> -->
            </li>
          </ul>
        </div>
      </div>

    </div>
  </div>--%>
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
    <!-- <div class="cover"></div> -->

  </div>


  <!-- 业务体系 -->

  <c:forEach items="${homepages}" var="itemDto">
  <div class="business">
    <img src="${itemDto.src}" alt="">
  </div>
  </c:forEach>
<%--  <!-- 我们的优势 -->
  <div class="business">
    <img src="../../../upload/image/20200612/2.png" alt="">
  </div>
  <!-- 技术体系 -->
  <div class="business">
    <img src="../../../upload/image/20200612/3.png" alt="">
  </div>--%>
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
          <a href="/case/detail?id=${itemDto.id}" target="_blank">MORE..</a>
        </div>
      </div>
      </c:forEach>
    </div>
    <!-- 查看更多 -->
    <div class="checkMore">
      <a href="javascript:;" target="_blank">查看更多 +</a>
    </div>
  </div>
<jsp:include page="footer.jsp"/>
<%--  <!-- 底部 -->
  <div class="footer">
    <div class="footerContent">
      <!-- 公司介绍 -->
      <div class="companyIntroduction">
        <h4>公司简介</h4>
        <p>江苏倍速世纪集团 旗下：南京长江都市楼宇科技有限责任公司、南京倍速创恒信息技术有限公司和EVOLUTION CONTROL(HONGKONG)三家全资控股子公司。</p>
        <p>
          经过数年的沉淀与发展，倍速世纪逐渐形成：旗下企业“三足鼎立”，集团公司两级管理的发展模式。公司目前在北京、上海、香港、深圳、淮安等地设有分公司及办事处。新年伊始，未来已来。倍速世纪希望与更多有识之士携手同行，为企业间共赢发展翻开崭新篇章！
        </p>
        <p>企业理念:互联的物联网时代和增强现实</p>
        <p>企业使命: 将先进的计算技术和通信技术作为创新的解决方案，提高客户的竞争力和应对数字技术惊人的进化能力。</p>
      </div>
      <div class="companyMessage">
        <h4>公司信息</h4>
        <p>电话: (025)51809281</p>
        <p>邮箱: sale@cen-speed.com</p>
        <p>公司地址: 中国 • 南京 应天大街388号1865创意园E9栋</p>
      </div>
    </div>
  </div>--%>

  <!-- 咨询悬浮框 -->
  <div class="suspensionBox">
    <!-- 咨询 -->
    <div class="suspension" data-toggle="modal" data-target="#suspensionModal">
      <img src="assets/images/lianxi.png" alt="">
      <p>咨询</p>
    </div>
    <div class="toTop">
      <img src="assets/images/toTop.png" alt="">
    </div>
    </div>
    <!-- 隐藏部分 -->
    <!-- Modal -->
    <!-- Modal -->
<div class="modal fade" id="suspensionModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">联系我们</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
        <p>您的联系方式:</p>
        <div class="contactInfo">
          <input type="text" placeholder="姓名..">
          <input type="text" placeholder="电话..">
          <input type="text" placeholder="邮箱..">
          <input type="text" placeholder="公司名称..">
        </div>
        <p>咨询内容:</p>
        <div class="consultInfo">
          <textarea name="" id="" cols="30" rows="10" placeholder="请输入咨询内容.."></textarea>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary">提交</button>
      </div>
    </div>
  </div>
</div>
<jsp:include page="footer.jsp"/>
<jsp:include page="homeBottom.jsp"/>

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