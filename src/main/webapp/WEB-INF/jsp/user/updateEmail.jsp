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
                           type="text" name="id" value="${user.id}" >
                </div>
            </div>




            <div class="form-group">
            <label class="col-sm-2 control-label">邮箱：</label>
            <div class="col-sm-6">
            <input class="filter-input-filed form-control" id="email" placeholder="请输入邮箱"
            type="text" name="email" value="${user.email}">
            </div>
            </div>


        <div class="form-group">
        <label for="id" class="col-sm-2 control-label">
        <button class="btn btn-primary " onclick="upload()" >
        确认
        </button>
        </label>
        </div>




        <script type="text/javascript">

            var isEmail=false;
            email.onchange = function(){

                var email = this.value;
                var reg = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
                if(reg.test(email)){
                    isEmail = true;
                }else{
                    alert("邮箱格式不正确");
                }
            }



        function checkForm() {
        var flag=true;
        $("#frm input[type='text']").each(function (i, obj) {
        if (null == this.value ||"" == this.value || undefined==this.value) {
        toastr.error($(obj).prop("placeholder"))
        flag=false;
        return false;
        }
        })
        return flag;
        }

        function upload() {
        $("#frm").attr("action","/user/update");
        with($("#frm").get(0)){
            if (isEmail==false){alert("邮箱格式不正确")
            return}
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