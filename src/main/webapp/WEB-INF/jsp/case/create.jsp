<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <title>创建案例</title>
    <meta name="case" content="create"/>
    <%-- 页面头部样式开始----------------------------------------------------------%>
    <jsp:include page="/decorator/sellerHead.jsp"/>
    <%-- 页面头部样式结束---------------------------------------------------------%>
</head>
<body>
<div class="main">
    <%--上边菜单开始-------------------------------------------------------------%>
    <jsp:include page="${ctx}/decorator/sellerTopMenu.jsp"/>
    <%--上边菜单结束-------------------------------------------------------------%>


    <%--正文开始-----------------------------------------------------------------%>
    <div class="perscenter-ui">
        <div class="main-layout">
            <div class="wrapper">
                <div class="content-layout">

                    <%--左边菜单开始-----------------------------------------------------%>
                    <jsp:include page="${ctx}/decorator/sellerLeftMenu.jsp"/>
                    <%--左边菜单结束-----------------------------------------------------%>

                        <form id="frm" class="form-horizontal editgoods grey edit-goods-new distProduct" action="${ctx}/case/upload" method="post"  onsubmit="return false">
                            <h2>案例信息</h2>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">公司名称：</label>
                                <div class="col-sm-6">
                                    <input class="filter-input-filed form-control" id="companyName" placeholder="请输入名称"
                                           type="text" name="companyName">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">客户LOGO：</label>
                                <div class="col-sm-6" >
                                    <input type="hidden" id="txtIconurl" name="companyLogo" />
                                    <input type="button"  class="btn btn-primary btn-lg" id="btnIconUpLoader" value="上传图片" onclick="upIcon()"/>
                                    <span class="glyphicon glyphicon-question-sign tips" >
                                    <span class="tooltipDiv">建议尺寸：180*160px</span>
                                    </span>
                                    <textarea id="uploadIconEditor" style="display: block;"></textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">简介：</label>
                                <div class="col-sm-6">
                                    <input class="filter-input-filed form-control" id="companyIntroduct" placeholder="请输入简介"
                                           type="text" name="companyIntroduct">
                                </div>
                            </div>



                            <div class="form-group">
                                <label class="col-sm-2 control-label">背景图片：</label>
                                <div class="col-sm-6" >
                                    <input type="hidden" id="txtImgurl" name="backgroundImage" />
                                    <input type="button"  class="btn btn-primary btn-lg" id="btnImageUpLoader" value="上传图片" onclick="upImage()"/>
                                   <textarea id="uploadEditor" style="display: block;"></textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">应用案例：</label>
                                <div class="col-sm-6">
                                    <input class="filter-input-filed form-control" id="name" placeholder="请输入应用案例"
                                           type="text" name="name">
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
                                <label class="col-sm-2 control-label">案例详情：</label>
                                <div class="col-sm-6">
                                    <textarea id="editor" name="caseContent" type="text/plain" style="width:664px;height:500px;"></textarea>
                                </div>
                            </div>


                            <div class="form-group">
                                <label for="name" class="col-sm-2 control-label">
                                    <button class="btn btn-primary " onclick="upload()" >
                                        确认
                                    </button>
                                </label>
                            </div>



                            <script type="text/javascript" charset="utf-8" src="${ctx}/ueditor/ueditor.config.js"></script>
                            <script type="text/javascript" charset="utf-8" src="${ctx}/ueditor/ueditor.all.js"></script>
                            <script type="text/javascript" charset="utf-8" src="${ctx}/ueditor/lang/zh-cn/zh-cn.js"></script>

                            <script type="text/javascript" src="${ctx}/js/fwb.js"></script>
                            <script type="text/javascript">

                                // 实例化编辑器，这里注意配置项隐藏编辑器并禁用默认的基础功能。
                                var uploadEditor = UE.getEditor("uploadEditor");
                                uploadEditor.ready(function() {
                                    uploadEditor.setDisabled();
                                    uploadEditor.hide();
                                    uploadEditor.addListener('beforeInsertImage', function(t, arg) {
                                        //因为可以上传多张,所以就用arg[0]
                                        var res = [];
                                        $("#backgorudImg").remove();
                                        $("#dImg").remove();
                                        for (var i = 0; i < arg.length; i++) {
                                            res.push(arg[i].src);
                                            $("#btnImageUpLoader").attr("style","margin-top: -100px;margin-right: 20px;");
                                            $("#btnImageUpLoader").after("<img id='backgorudImg' style='margin: 10px' src='"+arg[i].src+"' width='100' height='100' >" +
                                                " <button id='dImg' class='btn btn-primary ' onclick='deleteBackgorudImg()' >清除</button>");
                                        }
                                        $("#txtImgurl").attr("value", res);
                                    });
                                });
                                var uploadIconEditor = UE.getEditor("uploadIconEditor");

                                uploadIconEditor.ready(function() {
                                    uploadIconEditor.setDisabled();
                                    uploadIconEditor.hide();
                                    uploadIconEditor.addListener('beforeInsertImage', function(t, arg) {
                                        //因为可以上传多张,所以就用arg[0]
                                        var res = [];
                                        $("#icon").remove();
                                        $("#dIcon").remove();
                                        for (var i = 0; i < arg.length; i++) {
                                            res.push(arg[i].src);
                                            $("#btnIconUpLoader").attr("style","margin-top: -100px;margin-right: 20px;");
                                            $("#btnIconUpLoader").after("<img id='icon' style='margin: 10px' src='"+arg[i].src+"' width='100' height='100' >" +
                                                " <button id='dIcon' class='btn btn-primary ' onclick='deleteIcon()' >清除</button> ");
                                        }
                                        $("#txtIconurl").attr("value", res);
                                    });
                                });

                                function upImage() {
                                    var m;
                                    m = uploadEditor.getDialog("insertimage");
                                    m.render();
                                    m.open();
                                }
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
                                    $("#frm").attr("action","${ctx}/case/upload");
                                    with($("#frm").get(0)){
                                        if(checkForm())
                                            submit();
                                        toastr.success("发布商品成功")
                                    }
                                }

                                function deleteIcon() {
                                    $("#txtIconurl").attr("value", '');
                                    $("#icon").remove();
                                    $("#dIcon").remove();
                                    $("#btnIconUpLoader").attr("style", "margin-top: 0px; ");
                                }
                                function deleteBackgorudImg() {
                                    $("#txtImgurl").attr("value", '');
                                    $("#backgorudImg").remove();
                                    $("#dImg").remove();
                                    $("#btnImageUpLoader").attr("style", "margin-top: 0px; ");
                                }
                            </script>
                        </form>
                </div>
            </div>
        </div>
        <%--正文结束-----------------------------------------------------------------%>

    </div>


    <%--页脚开始   -------------------------------------------------------------------%>
    <jsp:include page="${ctx}/decorator/footer.jsp"/>
    <%--页脚结束   -------------------------------------------------------------------%>

    <%-- 底部js开始 --%>
    <jsp:include page="${ctx}/decorator/sellerBottom.jsp"/>
    <%-- 底部js结束 --%>

</body>

</html>