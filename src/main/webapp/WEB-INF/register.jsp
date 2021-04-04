<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
    var contextPath = "${ctx}";
</script>
<html class="x-admin-sm" lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="${ctx}/statics/css/font.css">
    <link rel="stylesheet" href="${ctx}/statics/css/login.css">
    <link rel="stylesheet" href="${ctx}/statics/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="${ctx}/statics/lib/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="${ctx}/statics/lib/layui/css/layui.css">
</head>
<body class="login-bg">
<div class="login layui-anim layui-anim-up" style="margin-top: 30px">
    <div class="message">Hotel - 用户注册</div>
    <div id="darkbannerwrap"></div>
    <form method="post" class="layui-form">
        <input hidden name="userType" value="2">
        <div class="layui-form-item">
            <input name="loginName" placeholder="登录名"  type="text" class="layui-input" >
            <i style="position: absolute;left: 340px;top: 145px;font-size: 30px;color: #5FB878;" id="loginNameOk" hidden class="layui-icon layui-icon-ok-circle"></i>
            <i style="position: absolute;left: 340px;top: 145px;font-size: 30px;color: red;" id="loginNameClose" hidden class="layui-icon layui-icon-close-fill"></i>
        </div>
        <hr class="hr15">
        <input name="password" id="password" placeholder="密码" pattern="[0-9]{6,12}"  type="password" class="layui-input" autocomplete="off">
        <hr class="hr15">
        <input name="rePassword" id="rePassword" placeholder="重新输入密码" pattern="[0-9]{6,12}"  type="password" class="layui-input" autocomplete="off">
        <hr class="hr15">
        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="radio" name="sex" value="0" title="男" checked><div class="layui-unselect layui-form-radio layui-form-radioed"><i class="layui-anim layui-icon"></i><div>男</div></div>
                <input type="radio" name="sex" value="1" title="女"><div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i><div>女</div></div>
            </div>
        </div>
        <hr class="hr15">
        <div class="layui-form-item">
            <input name="idCard" placeholder="身份证号"  type="text" class="layui-input" autocomplete="off">
            <i style="position: absolute;left: 340px;top: 420px;font-size: 30px;color: #5FB878;" id="idCardOk" hidden class="layui-icon layui-icon-ok-circle"></i>
            <i style="position: absolute;left: 340px;top: 420px;font-size: 30px;color: red;" id="idCardClose" hidden class="layui-icon layui-icon-close-fill"></i>
        </div>
        <hr class="hr15">
        <input value="立即注册" lay-submit lay-filter="register" style="width:100%;" type="button" onclick="register()">
        <hr class="hr20" >
    </form>
    已有账号？<a href="${ctx}/Login/toLogin" style="text-decoration: underline;color: #00A195">直接登录>></a>
    <a href="${ctx}/user/toFindPassword"><span style="text-decoration: underline;margin-left: 150px">找回密码</span></a>
</div>
<script type="text/javascript" src="${ctx}/statics/js/register.js"></script>
</body>
</html>