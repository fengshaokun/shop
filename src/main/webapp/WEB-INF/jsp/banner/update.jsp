<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <title>创建产品</title>
    <meta name="product" content="create"/>
    <%-- 页面头部样式开始----------------------------------------------------------%>
    <jsp:include page="/decorator/sellerHead.jsp"/>
    <link rel="stylesheet" type="text/css" href="/menu/css/zTreeStyle.css"/>

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

                        <form id="frm" class="form-horizontal editgoods grey edit-goods-new distProduct" action="/seller/uploadGood" method="post"  onsubmit="return false">
                            <h2>banner</h2>
                            <div class="form-group" style="display:none">
                                <label class="col-sm-2 control-label">id：</label>
                                <div class="col-sm-6">
                                    <input class="filter-input-filed form-control" id="id"
                                           type="text" name="id" value="${banner.id}" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">标题：</label>
                                <div class="col-sm-6">
                                    <input class="filter-input-filed form-control" id="title" placeholder="请输入标题"
                                           type="text" name="title" value="${banner.title}">
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-sm-2 control-label">副标题：</label>
                                <div class="col-sm-6">
                                    <input class="filter-input-filed form-control" id="subtitle" placeholder="请输入副标题"
                                           type="text" name="subtitle" value="${banner.subtitle}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">图片：</label>
                                <div class="col-sm-6" >
                                    <input type="hidden" id="txtIconurl" name="image" value="${banner.image}"/>
                                    <input type="button"  class="btn btn-primary btn-lg" id="btnIconUpLoader" value="上传图片" onclick="upIcon()" style="margin-top: -100px; margin-right: 20px;"/>
                                    <img id='icon' style='margin: 10px' src='${banner.image}' width='100' height='100' >
                                    <textarea id="uploadIconEditor" style="display: block;"></textarea>
                                </div>
                            </div>






                            <div class="form-group">
                                <label for="title" class="col-sm-2 control-label">
                                    <button class="btn btn-primary " onclick="upload()" >
                                        确认
                                    </button>
                                </label>
                            </div>




                        </form>
                </div>
            </div>
        </div>
        <%--正文结束-----------------------------------------------------------------%>

    </div>


    <%--页脚开始   -------------------------------------------------------------------%>
    <jsp:include page="/decorator/footer.jsp"/>
    <%--页脚结束   -------------------------------------------------------------------%>
        <script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.config.js"></script>
        <script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.all.js"></script>
        <script type="text/javascript" charset="utf-8" src="/ueditor/lang/zh-cn/zh-cn.js"></script>
        <script type="text/javascript" src="/js/fwb.js"></script>

    <%-- 底部js开始 --%>
    <jsp:include page="/decorator/sellerBottom.jsp"/>
    <%-- 底部js结束 --%>



        <script type="text/javascript">

            // 实例化编辑器，这里注意配置项隐藏编辑器并禁用默认的基础功能。

            var uploadIconEditor = UE.getEditor("uploadIconEditor");

            uploadIconEditor.ready(function() {
                /*   uploadIconEditor.setDisabled();*/
                uploadIconEditor.hide();
                uploadIconEditor.addListener('beforeInsertImage', function(t, arg) {
                    //因为可以上传多张,所以就用arg[0]
                    var res = [];
                    $("#icon").remove();
                    $("#dIcon").remove();
                    for (var i = 0; i < arg.length; i++) {
                        res.push(arg[i].src);
                        $("#btnIconUpLoader").attr("style","margin-top: -100px;margin-right: 20px;");
                        $("#btnIconUpLoader").after("<img id='icon' style='margin: 10px' src='"+arg[i].src+"' width='100' height='100' >");
                    }
                    $("#txtIconurl").attr("value", res);
                });
            });

            function upIcon() {
                var m;
                m = uploadIconEditor.getDialog("insertimage");
                m.render();
                m.open();
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
                $("#frm").attr("action","/banner/updateBanner");
                with($("#frm").get(0)){
                    if(checkForm()){
                        submit();
                        toastr.success("修改成功")
                    }

                }
            }


        </script>
</body>

</html>