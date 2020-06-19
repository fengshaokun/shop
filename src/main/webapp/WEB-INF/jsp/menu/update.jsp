    <%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html>

        <head>
        <title>修改菜单</title>
        <meta name="menu" content="update"/>
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
        <form id="frm" class="form-horizontal editgoods grey edit-goods-new distProduct" action="/menu/updateMenu"
        method="post" onsubmit="return false">
        <h2>修改菜单</h2>

        <div class="form-group" style="display:none">
        <label class="col-sm-2 control-label">id：</label>
        <div class="col-sm-6">
        <input class="filter-input-filed form-control" id="id"
        type="text" name="id" value="${cMenu.id}" >
        </div>
        </div>

        <div class="form-group">
        <label class="col-sm-2 control-label">主标题：</label>
        <div class="col-sm-6">
        <input class="filter-input-filed form-control" id="principal" placeholder="请输入主标题"
        type="text" name="principal" value="${cMenu.principal}">
        </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">副标题：</label>
            <div class="col-sm-6">
            <input class="filter-input-filed form-control" id="subordinate" placeholder="请输入副标题"
            type="text" name="subordinate" value="${cMenu.subordinate}">
            </div>
            </div>

            <div class="form-group">
            <label class="col-sm-2 control-label">url：</label>
            <div class="col-sm-6">
            <input class="filter-input-filed form-control" id="url" placeholder="请输入url"
            type="text" name="url" value="${cMenu.url}">
            </div>
            </div>
            <div class="form-group">
            <label class="col-sm-2 control-label">排序：</label>
            <div class="col-sm-6">
            <input class="filter-input-filed form-control" id="sort" placeholder="请输入排序"
            type="text" name="sort" value="${cMenu.sort}" >
            </div>
            </div>

        <div class="form-group">
        <label class="col-sm-2 control-label">绑定上一级菜单：</label>
        <div class="col-sm-6">

        <input class="filter-input-filed" id="pid" type="hidden" name="pid" value="${cMenu.cMenu.id}" type="text">
        <input class="filter-input-filed form-control" placeholder="请选择菜单" readonly
        id="modal"
        data-toggle="modal" data-target="#myModal" value="${cMenu.cMenu.principal}">
        </div>
        </div>



<%--            <div class="form-group">
            <label class="col-sm-2 control-label">绑定上一级菜单：</label>
            <div class="col-sm-6">
            <select class="filter-input-filed form-control" name="pid" id="pid">
        <option value="0" >无</option>
        <c:forEach items="${pMenu}" var="itemDto">
            <option <c:if test="${cMenu.pid==itemDto.id}"> selected </c:if>  value="${itemDto.id}">${itemDto.id}--------->${itemDto.principal}</option>
        </c:forEach>
            </select>
            </div>
            </div>--%>


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
        if ($("#id").val()==$("#pid").val()){
        toastr.error("请勿选择自己")
        flag=false;
        }
        return flag;
        }

        function upload() {
        $("#frm").attr("action","/menu/updateMenu");
        with($("#frm").get(0)){
        if(checkForm())
        submit();
        toastr.success("修改菜单成功")
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
        /* beforeClick: zTreeBeforeClick,*/
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
        /*function zTreeBeforeClick(treeId, treeNode, clickFlag) {
        return !treeNode.isParent;//当是父节点 返回false 不让选取
        };*/
        function zTreeOnClick(event, treeId, treeNode) {
        menuId=treeNode.id;
        menuName=treeNode.principal;
        };
        function toMenu() {
           var id =$("#id").val();
        $("#pid").val(menuId);
        if (id==menuId){
            alert("请勿选择自己")
        }
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