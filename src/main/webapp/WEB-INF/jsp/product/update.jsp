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
                            <h2>商品基本信息</h2>
                            <div class="form-group" style="display:none">
                                <label class="col-sm-2 control-label">id：</label>
                                <div class="col-sm-6">
                                    <input class="filter-input-filed form-control" id="id"
                                           type="text" name="id" value="${product.id}" >
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">产品名称：</label>
                                <div class="col-sm-6">
                                    <input class="filter-input-filed form-control" id="name" placeholder="请输入名称"
                                           type="text" name="name" value="${product.name}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">产品图标：</label>
                                <div class="col-sm-6" >
                                    <input type="hidden" id="txtIconurl" name="icon" value="${product.icon}"/>
                                    <input type="button"  class="btn btn-primary btn-lg" id="btnIconUpLoader" value="上传图片" onclick="upIcon()" style="margin-top: -100px; margin-right: 20px;"/>
                                    <span class="glyphicon glyphicon-question-sign tips" >
                                    <span class="tooltipDiv">建议尺寸：180*135px</span>
                                    </span>

                                    <img id='icon' style='margin: 10px' src='${product.icon}' width='100' height='100' >
                                    <button id='dIcon' class='btn btn-primary ' onclick='deleteIcon()' >清除</button>
                                    <textarea id="uploadIconEditor" style="display: block;"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">标签：</label>
                                <div class="col-sm-6">
                                    <input class="filter-input-filed form-control" id="tag" placeholder="请输入标签"
                                           type="text" name="tag" value="${product.tag}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">简介：</label>
                                <div class="col-sm-6">
                                    <input class="filter-input-filed form-control" id="briefIntroduction" placeholder="请输入简介"
                                           type="text" name="briefIntroduction" value="${product.briefIntroduction}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">是否热卖：</label>
                                <div class="col-sm-6">
                                    <label><input  type="radio" <c:if test="${product.isHot==0}"> checked</c:if> name="isHot" value="0">是</label>
                                    <label><input  type="radio" <c:if test="${product.isHot==1}"> checked</c:if> name="isHot" value="1">否</label>
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-sm-2 control-label">是否新品：</label>
                                <div class="col-sm-6">
                                    <label><input  type="radio" <c:if test="${product.isNew==0}"> checked</c:if> name="isNew" value="0">是</label>
                                    <label><input  type="radio"<c:if test="${product.isNew==1}"> checked</c:if> name="isNew" value="1">否</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">绑定菜单：</label>
                                <div class="col-sm-6">

                                    <input class="filter-input-filed" id="menuId" type="hidden" name="menuId"  type="text" value="${menu.id}">
                                    <input class="filter-input-filed form-control" placeholder="请选择菜单" readonly
                                           id="modal"
                                           data-toggle="modal" data-target="#myModal" value="${menu.principal}" >
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">排序：</label>
                                <div class="col-sm-6">
                                    <input class="filter-input-filed form-control" id="sort" placeholder="请输入排序"
                                           type="text" name="sort" value="${product.sort}">
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-sm-2 control-label">视频：</label>
                                <div class="col-sm-6" >
                                    <input type="hidden" id="txtVideourl" name="video" />
                                    <input type="button"  class="btn btn-primary btn-lg" id="btnVideoUpLoader" value="上传视频" onclick="upVideo()"/>
                                    <textarea id="uploadVideoEditor" style="display: none;" ></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">上架时间：</label>
                                <div class="col-sm-6">
                                    <input class="filter-input-filed form-control" placeholder="请选择上架时间" readonly id="onTime" name="onTime"
                                           type="text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  value="${product.createTime.toLocaleString()}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">产品详情：</label>
                                <div class="col-sm-6">
                                    <textarea id="editor" name="productContent" type="text/plain" style="width:664px;height:500px;"></textarea>
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
                                            $("#btnIconUpLoader").after("<img id='icon' style='margin: 10px' src='"+arg[i].src+"' width='100' height='100' >" +
                                                "<button id='dIcon' class='btn btn-primary ' onclick='deleteIcon()' >清除</button>");
                                        }
                                        $("#txtIconurl").attr("value", res);
                                    });
                                });



                                var uploadVideoEditor = UE.getEditor("uploadVideoEditor");
                                    uploadVideoEditor.ready(function() {
                                /*   uploadVideoEditor.setDisabled();*/
                                    uploadVideoEditor.hide();
                                        uploadVideoEditor.addListener('myinsertvideo', function(t, arg) {
                                            //因为可以上传多张,所以就用arg[0]
                                            var res = [];
                                            for (var i = 0; i < arg.length; i++) {
                                                alert(arg[i].url)
                                                res.push(arg[i].url);
                                                $("#btnVideoUpLoader").attr("style","margin-top: -100px;margin-right: 20px;");
                                                $("#btnVideoUpLoader").after("<video class=\"edui-upload-video video-js vjs-default-skin video-js\" controls=\"\" preload=\"none\" width=\"420\" height=\"280\" src='"+arg[i].url+"' data-setup=\"{}\">\n" +
                                                    "        <source src='"+arg[i].url+"' type=\"video/mp4\"/>\n" +
                                                    "    </video>");
                                            }
                                            $("#txtVideourl").attr("value", res);
                                        });

                                    });

                               var editor = UE.getEditor('editor');
                                editor.ready(function() {
                                    editor.setContent('${product.cProductDetails.productContent}');
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

                                function upVideo() {
                                    var m;
                                    m = uploadVideoEditor.getDialog("insertvideo");
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
                                    $("#frm").attr("action","/product/updateGoods");
                                    with($("#frm").get(0)){
                                        if(checkForm()){
                                            submit();
                                            toastr.success("修改产品成功")
                                        }

                                    }
                                }

                                function deleteIcon() {
                                    $("#txtIconurl").attr("value", '');
                                    $("#icon").remove();
                                    $("#dIcon").remove();
                                    $("#btnIconUpLoader").attr("style", "margin-top: 0px; ");
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
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">请选择菜单</h4>
                    </div>
                    <div class="modal-body">
                        <div class="zTreeDemoBackground left">
                            <ul id="treeDemo" class="ztree"></ul>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="toMenu()">确认</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
        <script src="/menu/js/jquery.ztree.core.js" type="text/javascript" charset="utf-8"></script>
        <script src="/menu/js/jquery.ztree.excheck.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript">
            var setting = {
                callback: {
                    beforeClick: zTreeBeforeClick,
                    onClick: zTreeOnClick
                },
                data: {
                    key: {
                        name:"principal",
                        url: "xUrl"
                    },
                    simpleData: {
                        enable: true,
                        idKey: "id",
                        pIdKey: "pid",
                        rootPId: 0
                    }
                },
                view: {
                    selectedMulti: false
                }
            };

            var menuId ;
            var menuName;
            function zTreeBeforeClick(treeId, treeNode, clickFlag) {
                return !treeNode.isParent;//当是父节点 返回false 不让选取
            };
            function zTreeOnClick(event, treeId, treeNode) {
                menuId=treeNode.id;
                menuName=treeNode.principal;
            };
            function toMenu() {
                $("#menuId").val(menuId);
                $("#modal").val(menuName);
            }
            var zNodes = [];
            $.ajax({
                url: "/menu/menuIndex", //请求的url地址
                dataType: "json", //返回格式为json
                async: true,//请求是否异步，默认为异步，这也是ajax重要特性
                data: {}, //参数值
                type: "post", //请求方式
                success: function (req) {
                    zNodes = req.data;
                    console.log(zNodes)
                    $.fn.zTree.init($("#treeDemo"), setting, zNodes);
                },
                error: function () {

                }
            });
        </script>
</body>

</html>