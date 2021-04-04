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
    <title>登录</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="${ctx}/statics/css/font.css">
    <link rel="stylesheet" href="${ctx}/statics/css/login.css">
    <link rel="stylesheet" href="${ctx}/statics/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="${ctx}/statics/lib/layui/layui.js" charset="utf-8"></script>
</head>
<body class="login-bg">
<div class="login layui-anim layui-anim-up">
    <div class="message">Hotel - 用户登录</div>
    <div id="darkbannerwrap"></div>
    <form method="post" class="layui-form" action="${ctx}/Login/login">
        <input name="loginName" placeholder="登录名"  type="text" lay-verify="required" class="layui-input" >
        <hr class="hr15">
        <input name="password" lay-verify="required" placeholder="密码"  type="password" class="layui-input" autocomplete="off">
        <hr class="hr15">
        <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
        <hr class="hr20" >
    </form>
    还没有账号？<a href="${ctx}/Register/toRegister" style="text-decoration: underline;color: #00A195">去注册>></a>
    <a href="${ctx}/user/toFindPassword"><span style="text-decoration: underline;margin-left: 150px">找回密码</span></a>
</div>
</body>
</html>