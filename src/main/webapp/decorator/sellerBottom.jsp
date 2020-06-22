<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set value="${pageConext.request.contextPath}" var="ctx"/>
<script src="/js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script type="text/javascript" charset="utf-8" src="/js/toastr.min.js"></script>
<script src="/js/jquery.cookie.min.js" type="text/javascript"></script>
<script src="/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/js/jquery.treetable.js"></script>
<script type="text/javascript" src="/js/jquery.browser.js"></script>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<script src="/js/bootstrap-treeview.js"></script>
<script src="/js/jquery.tmpl.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script>
<script type="text/javascript" src="/js/jqPaginator.js" ></script>


<script src="/js/app.js" type=""></script>
<script type="text/javascript">
$(function(){
toastr.options=
{
"closeButton":false,//显示关闭按钮
"debug":false,//启用debug
"positionClass":"toast-top-center",//弹出的位置
"showDuration":"300",//显示的时间
"hideDuration":"1000",//消失的时间
"timeOut":"3000",//停留的时间
"extendedTimeOut":"1000",//控制时间
"showEasing":"swing",//显示时的动画缓冲方式
"hideEasing":"linear",//消失时的动画缓冲方式
"showMethod":"fadeIn",//显示时的动画方式
"hideMethod":"fadeOut"//消失时的动画方式
};

});
</script>


