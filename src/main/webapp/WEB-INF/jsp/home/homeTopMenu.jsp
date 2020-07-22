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

<nav    id="headerNav"
        class="navbar navbar-default header"
        role="navigation"
        v-cloak
>
    <div class="container">
        <!-- container让导航条居中container-fluid让导航条自适应 -->
        <div class="navbar-header">
            <!-- 代表响应式布局：当浏览器宽度小于某个值时导航栏折叠变成三道杠 -->
            <button
                    class="navbar-toggle collapsed"
                    data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1"
                    type="button"
            >
                <span class="sr-only navbar-left">切换导航</span>
                <span class="icon-bar navbar-left"></span>
                <span class="icon-bar navbar-left"></span>
                <span class="icon-bar navbar-left"></span>
            </button>
            <!-- //代表导航栏左侧logo或者图标  -->
            <!-- <a class="navbar-brand" href="http://www.baidu.com">浏览器博物馆</a> -->
            <span class="navbar-brand">
            <a href="/home/index">
              <div class="logo">
                <img :src="logoSrc" alt="" />
              </div>
            </a>
          </span>
        </div>
        <!-- //导航条内容，为了响应式布局，点击三道杠弹出导航栏 -->
        <div class="headerContainer" >
            <!-- //代表导航栏中的项目 -->
            <ul
                    class="nav navbar-nav collapse navbar-collapse"
                    id="bs-example-navbar-collapse-1"
            >
                <li class="headerli" @mouseover="enter()" >

                        <span class="navName"><a href="/home/index">首页</a></span>

                </li>
                <li class="headerli header_case" :data-id="item.id" v-for="(item,index) in menuData" @mouseover="enter(index)" @click="enterclick()">
<%--                    <a href="/home/list">--%>
                        <span class="navName">{{item.principal}}</span>
                        <span class="glyphicon glyphicon-menu-down arrow"></span>
<%--                    </a>--%>
                </li>
                <li class="headerli" @mouseover="enter()" >
                    <span class="navName">
                    <a href="/home/caseShow">
                        案例
                    </a>
                        </span>
                </li>
            </ul>
            <!-- 搜索框 -->
            <form class="navbar-left formbox" role="search">
                <input id="param" type="text" class="form-control" placeholder="搜索" />
                <span
                        class="glyphicon glyphicon-search search-btn"
                        onclick="searchProduct()"
                ></span>
            </form>
        </div>
    </div>
    <div class="dropdown case" v-show="showdropdown" @mouseleave="leaveDropdown">
        <div class="container">
            <ul class="left_ul">
                <li :data-id="item.id" :data-to="index" v-for="(item,index) in currentMenuData.childMenu" class="right_li" :class="{'right_li_hover':currentMenuData.current == index}" @mouseenter="menuTo(index)">
                    <span>{{item.principal}}</span>
                </li>
            </ul>
            <div class="dropdownNav dropdownNav0">
                <ul class="right_ul">
                    <li v-for="(item,index) in menuProducts">
                        <div class="rightdiv"  @click="todetail(index)">
                        <img
                                :src="item.icon == '' || item.icon == null ? 'assets/images/zanwu.png':item.icon"
                                alt=""
                        />
                        <p>{{item.name}}</p>
                        <p>{{item.tag}}</p>
                    </div>
                    </li>

                </ul>
                <!-- 产看更多 -->
                <a href="/home/list" class="checkMoreClass">查看更多+</a>
            </div>
        </div>
    </div>
</nav>
<script>



function  searchProduct() {
    var val = $('#param').val();
    if (val!=null&&undefined!=val) {
        $.ajax({
            url: "/home/searchParam",    //请求的url地址
            dataType: "json",   //返回格式为json
            async: true,//请求是否异步，默认为异步，这也是ajax重要特性
            data: {"name":val},    //参数值
            type: "post",   //请求方式
            success: function (req) {
                if (req.status == 200) {
                    window.location.href="/home/lists?name="+val
                }
                else{
                    window.location.href="/home/kong?name="+val
                }
            },
            error: function () {

            }

        });
    }
}

</script>
</body>
</html>
