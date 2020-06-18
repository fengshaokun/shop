    <%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html>

        <head>
        <title>修改咨询用户信息</title>
        <meta name="menu" content="update"/>
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
        <form id="frm" class="form-horizontal editgoods grey edit-goods-new distProduct" action="/consult/updateConsult"
        method="post" onsubmit="return false">
        <h2>咨询用户信息</h2>

            <div class="form-group" style="display:none">
                <label class="col-sm-2 control-label">id：</label>
                <div class="col-sm-6">
                    <input class="filter-input-filed form-control" id="id"
                           type="text" name="id" value="${itemDto.id}" >
                </div>
            </div>

        <div class="form-group">
        <label class="col-sm-2 control-label">姓名：</label>
        <div class="col-sm-6">
        <input class="filter-input-filed form-control" id="name" placeholder="请输入姓名"
        type="text" name="name" value="${itemDto.name}">
        </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">电话：</label>
            <div class="col-sm-6">
            <input class="filter-input-filed form-control" id="tel" placeholder="请输入电话"
            type="text" name="tel" value="${itemDto.tel}">
            </div>
            </div>

            <div class="form-group">
            <label class="col-sm-2 control-label">邮箱：</label>
            <div class="col-sm-6">
            <input class="filter-input-filed form-control" id="email" placeholder="请输入邮箱"
            type="text" name="email" value="${itemDto.email}">
            </div>
            </div>
            <div class="form-group">
            <label class="col-sm-2 control-label">公司：</label>
            <div class="col-sm-6">
            <input class="filter-input-filed form-control" id="company" placeholder="请输入公司"
            type="text" name="company" value="${itemDto.company}">
            </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">咨询内容：</label>
                <div class="col-sm-6">
                    <input class="filter-input-filed form-control" id="content" placeholder="请输入内容"
                           type="text" name="content"  value="${itemDto.content}">
                </div>
            </div>




        <div class="form-group">
        <label for="name" class="col-sm-2 control-label">
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
        $("#frm").attr("action","/consult/updateConsult");
        with($("#frm").get(0)){
        if(checkForm())
        submit();
        toastr.success("修改成功")
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