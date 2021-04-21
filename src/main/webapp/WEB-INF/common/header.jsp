<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>header</title>
</head>
<%@include file="common.jsp"%>
<body>
<div class="container">
    <div class="layui-row">
        <%--  左侧  --%>
        <div class="logo">
            <a href="${ctx}/Home/toFrontHome">Smart Hotel</a>
        </div>
        <!-- 右侧 -->
        <ul class="layui-nav right" lay-filter="">
            <li class="layui-nav-item">
                <c:if test="${sessionScope.loginUser == null}">
                    <a href="${ctx}/Login/toLogin">请登录</a>
                </c:if>
                <c:if test="${sessionScope.loginUser != null}">
                    <a href="javascript:;">${sessionScope.loginUser.loginName}</a>
                    <dl class="layui-nav-child">
                        <!-- 二级菜单 -->
                        <dd>
                            <a onclick="xadmin.open('个人信息','../user/toPersonalInfo')">个人信息</a></dd>
                        <dd>
                            <a onclick="xadmin.open('修改密码','/hotel-management-system/user/toChangePassword')">修改密码</a></dd>
                        <dd>
                            <a href="${ctx}/Login/toLogin">切换帐号</a></dd>
                        <dd>
                            <a href="${ctx}/Login/loginOut">退出</a></dd>
                    </dl>
                </c:if>
            </li>
            <li class="layui-nav-item">
                <c:if test="${sessionScope.loginUser.type != 2 && sessionScope.loginUser != null}">
                    <a href="${ctx}/Home/toBackendHome">后台首页</a>
                </c:if>
            </li>
            <li class="layui-nav-item">
                <iframe width="300" scrolling="no" height="30" frameborder="0" allowtransparency="true" src="https://i.tianqi.com?c=code&id=34&color=%23FFFFFF&icon=1&site=14"></iframe>
            </li>
        </ul>
    </div>
</div>
</body>
</html>
