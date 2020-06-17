    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        <!DOCTYPE html>
        <html>

        <head>
        <title>菜单管理</title>
        <%-- 页面头部样式开始----------------------------------------------------------%>
        <jsp:include page="/decorator/sellerHead.jsp"/>
        <%-- 页面头部样式结束---------------------------------------------------------%>
        <meta name="menu" content="index"/>

        </head>

        <body>
        <div class="main">
        <%--上边菜单开始-------------------------------------------------------------%>
        <jsp:include page="/decorator/sellerTopMenu.jsp"/>
        <%--上边菜单结束-------------------------------------------------------------%>


        <%--正文开始-----------------------------------------------------------------%>
        <div class="perscenter-ui">
        <div class="main-layout">
        <div class="wrapper">
        <div class="content-layout">

        <%--左边菜单开始-----------------------------------------------------%>
        <jsp:include page="/decorator/sellerLeftMenu.jsp"/>
        <%--左边菜单结束-----------------------------------------------------%>
        <div class="bg_color percent-seller percent-seller-goods" id="searchCondition">

<%--
<table id="demoTreeTb" class="table table-bordered table-striped"> </table>
--%>


        <table id="treeTable" class="table table-bordered table-striped">
        <tr>
        <th role="row">id</th>
        <th>主标题</th>
        <th>副标题</th>
        <th>Url</th>
        <th>排序</th>
        <th>上一级菜单</th>
        <th>操作</th>
        </tr>
        <c:forEach items="${menus}" var="itemDto">
            <tr id="${itemDto.id}" pId="${itemDto.pid}">
            <td class="text-center">${itemDto.id}</td>
            <td class="text-center">${itemDto.principal}</td>
            <td class="text-center">${itemDto.subordinate}</td>
            <td class="text-center">${itemDto.url}</td>
            <td class="text-center">${itemDto.sort}</td>
            <td class="text-center">${itemDto.cMenu.principal}</td>
            <td class="text-center" width="70">
            <a href="/menu/update?id=${itemDto.id}" class="delete-good" >修改</a>
            <a onclick="return confirm('确定将此记录删除?')" class="delete-good delete-btn" data-id="${itemDto.id}">删除</a>
            </td>
            </tr>
        </c:forEach>
        </table>


        </div>
        </div>
        </div>
        </div>
        </div>
        </div>

            <script type="text/javascript" charset="utf-8" src="/layui/layui.all.js"></script>
            <script type="text/javascript" charset="utf-8" src="/layui/layui.js"></script>



        <script type="text/javascript">


        $(".delete-btn").click(function() {
        var id = ($(this).data('id'));

        $.ajax({
        type: "get",
        dataType: "json",
        url: "/menu/delete",
        data: {
        id:id
        },
        success: function (data) {

        if(data.status==400){
        // window.location.href="http://localhost:8087/portal/toMain"
        alert(data.msg)
        }
        if (data.status==200){
        window.location.href="/menu/toDelete?id="+id;
        }
        }
        });

        })


        </script>

        <%--页脚开始   -------------------------------------------------------------------%>
        <jsp:include page="/decorator/footer.jsp"/>
        <%--页脚结束   -------------------------------------------------------------------%>

        <%-- 底部js开始 --%>
        <jsp:include page="/decorator/sellerBottom.jsp"/>
        <%-- 底部js结束 --%>
        </body>


        </html>
