<%--
  Created by IntelliJ IDEA.
  User: fengshaokun
  Date: 2020/6/17
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- 顶部导航 -->
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
</div>
</body>
</html>
