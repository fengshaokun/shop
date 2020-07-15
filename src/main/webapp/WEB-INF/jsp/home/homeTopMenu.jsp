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
            <a href="/home/index"> <div class="logo">
                <img src="" alt="">
            </div></a>

        </li>
        <li class="headerli">
            <span><a href="/home/index">首页</a></span>
        </li>

      <%--  <li class="headerli">
            <span><a href="/home/list">产品列表</a></span>
        </li>--%>
        <li class="headerli">
            <span><a href="/home/caseShow">案例</a></span>
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
                <!-- 产看更多 -->
                <a href="/home/list"  class="checkMoreClass">查看更多+</a>
            </div>
        </div>

    </div>
</div>

<script>



function  searchProduct() {
    var val = $('#param').val();
    console.log("search======" +val)
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
