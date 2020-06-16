    <%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html>

        <head>
        <title>创建菜单</title>
        <meta name="menu" content="create"/>
        <%-- 页面头部样式开始----------------------------------------------------------%>
        <jsp:include page="/decorator/sellerHead.jsp"/>
        <%-- 页面头部样式结束---------------------------------------------------------%>
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
        <form id="frm" class="form-horizontal editgoods grey edit-goods-new distProduct" action="/menu/uploadGood"
        method="post" onsubmit="return false">
        <h2>创建菜单</h2>


        <div class="form-group">
        <label class="col-sm-2 control-label">主标题：</label>
        <div class="col-sm-6">
        <input class="filter-input-filed form-control" id="principal" placeholder="请输入主标题"
        type="text" name="principal">
        </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">副标题：</label>
            <div class="col-sm-6">
            <input class="filter-input-filed form-control" id="subordinate" placeholder="请输入副标题"
            type="text" name="subordinate">
            </div>
            </div>

            <div class="form-group">
            <label class="col-sm-2 control-label">url：</label>
            <div class="col-sm-6">
            <input class="filter-input-filed form-control" id="url" placeholder="请输入url"
            type="text" name="url">
            </div>
            </div>
            <div class="form-group">
            <label class="col-sm-2 control-label">排序：</label>
            <div class="col-sm-6">
            <input class="filter-input-filed form-control" id="sort" placeholder="请输入排序"
            type="text" name="sort">
            </div>
            </div>


            <div class="form-group">
            <label class="col-sm-2 control-label">绑定上一级菜单：</label>
            <div class="col-sm-6">
            <select class="filter-input-filed form-control" name="pid" id="pid">
        <option value="0" >无</option>
        <c:forEach items="${menus}" var="itemDto">
            <option value="${itemDto.id}">${itemDto.sort}--------->${itemDto.principal}</option>
        </c:forEach>
            </select>
            </div>
            </div>


        <div class="form-group">
        <label for="principal" class="col-sm-2 control-label">
        <button class="btn btn-primary " onclick="upload()" >
        确认
        </button>
        </label>
        </div>





        <script type="text/javascript">



        function checkForm() {
        var flag=true;
        $("#frm input[type='text']").each(function (i, obj) {
        if (null == this.value ||"" == this.value || undefined==this.value) {
        toastr.error($(obj).prop("placeholder"))
        flag=false;
        return false;
        }
        })
        $("#frm input[type='redio']").each(function (i, obj) {
        if (null == this.value ||"" == this.value || undefined==this.value) {
        toastr.error($(obj).prop("placeholder"))
        flag=false;
        return false;
        }
        })
        return flag;
        }

        function upload() {
        $("#frm").attr("action","/menu/uploadGood");
        with($("#frm").get(0)){
        if(checkForm())
        submit();
        toastr.success("发布商品成功")
        }
        }


        </script>
        </form>
        </div>
        </div>
        </div>
        <%--正文结束-----------------------------------------------------------------%>

        </div>


        <%--页脚开始   -------------------------------------------------------------------%>
        <jsp:include page="/decorator/footer.jsp"/>
        <%--页脚结束   -------------------------------------------------------------------%>

        <%-- 底部js开始 --%>
        <jsp:include page="/decorator/sellerBottom.jsp"/>
        <%-- 底部js结束 --%>

        </body>

        </html>