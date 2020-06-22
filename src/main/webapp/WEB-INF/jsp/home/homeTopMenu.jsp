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
                <img src="" alt="">
            </div>
        </li>
        <li class="headerli">
            <span><a href="/home/index">首页</a></span>
        </li>

        <li class="headerli">
            <span><a href="/home/caseShow">案例</a></span>
        </li>
        <li class="headerli">
            <span><a href="/home/list">产品列表</a></span>
        </li>
        <li class="headerli">
            <input id="param" type="text" placeholder="搜索...">
            <span onclick="searchProduct()"></span>
        </li>
    </ul>
    <!-- 下拉 -->
    <div class="dropdown case">
        <div>
            <ul class="left_ul">
            </ul>
            <div class="dropdownNav dropdownNav0">
                <ul class="right_ul">
                </ul>
            </div>
        </div>

    </div>
</div>

<script>

function  searchProduct() {
    var val = $('#param').val();
    if (val!=null&&"" != val&&undefined!=val){
       window.location.href="/home/list?name="+val
    }
}

</script>
</body>
</html>
