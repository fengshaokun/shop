<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <title>发布商品</title>
    <meta name="menu" content="toSellerUploadGoods"/>
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
                        <script id="template1" type="text/x-jquery-tmpl">
        <label class="control-label" style="background: no-repeat;">${'${'}$data}</label>:
        <input type="text"  class="wlong goods-title form-control"/>
</script>

                        <form id="frm" class="form-horizontal editgoods grey edit-goods-new distProduct" action="/seller/uploadGood" method="post"  onsubmit="return false">
                            <h2>商品基本信息</h2>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">产品名称：</label>
                                <div class="col-sm-6">
                                    <input class="filter-input-filed form-control" id="name" placeholder="请输入名称"
                                           type="text" name="name">
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-sm-2 control-label">产品菜单：</label>
                                <div class="col-sm-6">
                                    <input class="filter-input-filed" id="cid" type="hidden" name="cid">
                                    <input class="filter-input-filed form-control" placeholder="请选择产品菜单" readonly id="productType"
                                           data-toggle="modal" data-target="#myModal" type="text">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">标签：</label>
                                <div class="col-sm-6">
                                    <input class="filter-input-filed form-control" id="tag" placeholder="请输入标签"
                                           type="text" name="tag">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">简介：</label>
                                <div class="col-sm-6">
                                    <input class="filter-input-filed form-control" id="briefIntroduction" placeholder="请输入简介"
                                           type="text" name="briefIntroduction">
                                </div>
                            </div>


                       <%--     <div class="form-group">
                                <label class="col-sm-2 control-label">价格：</label>
                                <div class="col-sm-6">
                                    <div class="input-group">
                                        <div class="input-group-addon">￥</div>
                                        <input type="text" class="form-control" placeholder="请输入价格" id="showPrice" name="showPrice">
                                        <input type="hidden" id="price" name="price">
                                        <div class="input-group-addon">元</div>
                                    </div>
                                </div>
                            </div>--%>


                            <div class="form-group">
                                <label class="col-sm-2 control-label">背景图片：</label>
                                <div class="col-sm-6" >
                                    <input type="hidden" id="background" name="background" />
                                    <input type="button"  class="btn btn-primary btn-lg" id="btnImageUpLoader" value="上传图片" onclick="upImage()"/>
                                    <textarea id="uploadEditor" style="display: none;"></textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">视频：</label>
                                <div class="col-sm-6" >
                                    <input type="hidden" id="video" name="video" />
                                    <input type="button"  class="btn btn-primary btn-lg" id="btnVideoUpLoader" value="上传视频" onclick="upVideo()"/>
                                    <textarea id="uploadVidoEditor" style="display: none;"></textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">上架时间：</label>
                                <div class="col-sm-6">
                                    <input class="filter-input-filed form-control" placeholder="请选择上架时间" readonly id="onTime" name="onTime"
                                           type="text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" >
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">产品详情：</label>
                                <div class="col-sm-6">
                                    <textarea id="editor" type="text/plain" style="width:664px;height:500px;"></textarea>
                                </div>
                            </div>


                            <input type="hidden" id="eleAttrs" name="eleAttrs" readonly>

                            <div class="form-group">
                                <label for="name" class="col-sm-2 control-label">
                                    <button class="btn btn-primary " onclick="upload()" >
                                        确认
                                    </button>
                                </label>
                            </div>

                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                                    aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title">请选择商品类型</h4>
                                        </div>
                                        <div class="modal-body">
                                            <%-- <div id="treeview12" class="test" style="height:300px; overflow:scroll;"></div>--%>
                                            <ul id="category" class="ztree" style="height:400px; overflow:scroll;"></ul>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                    </div><!-- /.modal-content -->
                                </div><!-- /.modal-dialog -->
                            </div><!-- /.modal -->


                            <script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.config.js"></script>
                            <script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.all.js"></script>
                            <script type="text/javascript" charset="utf-8" src="/ueditor/lang/zh-cn/zh-cn.js"></script>
                            <script type="text/javascript" src="/js/fwb.js"></script>

                            <script type="text/javascript">
                                // 实例化编辑器，这里注意配置项隐藏编辑器并禁用默认的基础功能。
                                var uploadEditor = UE.getEditor("uploadEditor"                                                  );

                                uploadEditor.ready(function() {
                                    uploadEditor.setDisabled();
                                    uploadEditor.hide();
                                    uploadEditor.addListener('beforeInsertImage', function(t, arg) {
                                        //因为可以上传多张,所以就用arg[0]
                                        var res = [];
                                        for (var i = 0; i < arg.length; i++) {
                                            res.push(arg[i].src);
                                            $("#btnImageUpLoader").attr("style","margin-top: -100px;margin-right: 20px;");
                                            $("#btnImageUpLoader").after("<img style='margin: 10px' src='"+arg[i].src+"' width='100' height='100' >");
                                        }
                                        $("#txtImgurl").attr("value", res);
                                    });
                                });

                                function upImage() {
                                    var m;
                                    m = uploadEditor.getDialog("insertimage");
                                    m.render();
                                    m.open();
                                }

                                function upVideo() {
                                    var m;
                                    m = uploadEditor.getDialog("insertvideo");
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
                                    $("#frm").attr("action","/seller/uploadGood");
                                    with($("#frm").get(0)){
                                        if(checkForm())
                                            submit();
                                        toastr.success("发布商品成功")
                                    }
                                }


                                $(function () {
                                    $("#showPrice").blur(function(){
                                        //把价格转成分存储
                                        $("#price").val($("#showPrice").val()*100);
                                    })
                                })

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