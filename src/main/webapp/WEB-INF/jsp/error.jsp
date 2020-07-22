<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="shortcut icon" href="/img/icon.ico" type="image/x-icon" />
    <link
            rel="stylesheet"
            href="/css/bootstrap.min.3.3.5.css"
    />
    <link rel="stylesheet" href="/css/404.css" />
</head>
<body>
<div class="errorpPage-wrap">
    <div class="errorpPage-box container">
        <div class="errorpPage-img">
            <img src="/img/404.png" />
        </div>
        <div class="errorpPage-tip">
            <h3>对不起！发生了一些意想不到的错误。</h3>
            <p>请联系管理员进行处理，您可以：</p>
        </div>
        <div class="errorpPage-operate">
            <a
                    href="javascript:window.opener=null;window.open('','_self');window.close();"
            >关闭页面</a
            >
            <a href="javascript:window.location.reload()">刷新试试</a>
            <a href="/product/index">返回首页</a>
        </div>
    </div>
</div>
</body>
</html>
