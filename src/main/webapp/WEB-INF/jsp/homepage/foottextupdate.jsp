<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <title>底部修改</title>
    <meta name="product" content="create"/>
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

                    <form id="frm" class="form-horizontal editgoods grey edit-goods-new distProduct" action="/homepage/updateFoot" method="post"  onsubmit="return false">
                        <h2>首页底部</h2>

                        <div class="form-group"  style="display:none">
                            <label class="col-sm-2 control-label">id：</label>
                            <div class="col-sm-6">
                                <input class="filter-input-filed form-control" id="id" placeholder="请输入id"
                                       type="text" name="id" value="${foot.id}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">名称：</label>
                            <div class="col-sm-6">
                                <input class="filter-input-filed form-control" id="name" placeholder="请输入名称"
                                       type="text" name="name" value="${foot.name}">
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-sm-2 control-label">底部左边内容：</label>
                            <div class="col-sm-6">
                                <textarea id="editor" name="leftText" type="text/plain" style="width:664px;height:500px;"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">底部右边内容：</label>
                            <div class="col-sm-6">
                                <textarea id="editor1" name="rightText" type="text/plain" style="width:664px;height:500px;"></textarea>
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label">
                                <button class="btn btn-primary " onclick="upload()" >
                                    确认
                                </button>
                            </label>
                        </div>



                        <script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.config.js"></script>
                        <script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.all.js"></script>
                        <script type="text/javascript" charset="utf-8" src="/ueditor/lang/zh-cn/zh-cn.js"></script>

                        <script type="text/javascript" src="/js/fwb.js"></script>
                        <script type="text/javascript">

                            var editor = UE.getEditor('editor');
                            editor.ready(function() {
                                editor.setContent('${foot.leftText}');
                            });

                            var editor1= UE.getEditor('editor1');
                            editor1.ready(function() {
                                editor1.setContent('${foot.rightText}');
                            });


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
                                $("#frm").attr("action","/homepage/updateFoot");
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