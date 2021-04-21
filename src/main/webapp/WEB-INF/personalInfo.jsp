<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>个人信息</title>
</head>
<%@include file="common/common.jsp"%>
<body>
<div class="layui-col-md10 layui-col-md-offset1">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
        <legend>基本信息</legend>
    </fieldset>

    <table class="layui-table" lay-size="lg">
        <colgroup>
            <col width="150">
            <col width="200">
        </colgroup>
        <tbody>
        <tr>
            <td>登录名</td>
            <td>${sessionScope.loginUser.loginName}</td>
        </tr>
        <tr>
            <td>密码</td>
            <td id="hiddenPassword">********</td>
            <td id="realPassword" hidden>${sessionScope.loginUser.password}</td>
        </tr>
        <tr>
            <td>性别</td>
            <td>${sessionScope.loginUser.sex == 0 ? '男':'女'}</td>
        </tr>
        <tr>
            <td>身份证号</td>
            <td id="hiddenIdCard">${sessionScope.loginUser.idCard.substring(0,6)}*********${sessionScope.loginUser.idCard.substring(sessionScope.loginUser.idCard.length()-4)}</td>
            <td id="realIdCard" hidden>${sessionScope.loginUser.idCard}</td>
        </tr>
        </tbody>
    </table>
    <br/><br/><br>
    <button type="button" class="layui-btn layui-btn-lg layui-btn-danger" style="margin-left: 200px" id="hideInfo">隐藏详细信息</button>
    <button type="button" class="layui-btn layui-btn-lg layui-btn-normal" style="margin-left: 30px" id="viewInfo">查看详细信息</button>
    <button type="button" class="layui-btn layui-btn-lg layui-btn-warm" style="margin-left: 30px" id="modifyInfo"
            onclick="xadmin.open('编辑','../user/toUpdateUser?info=1&id='+${sessionScope.loginUser.id},600,520);">修改个人信息</button>
</div>
</body>
<script>
    //点击隐藏信息
    $("#hideInfo").click(function () {
        $("#hiddenPassword").show();
        $("#hiddenIdCard").show();
        $("#realPassword").hide();
        $("#realIdCard").hide();
    });
    //点击查看详细信息
    $("#viewInfo").click(function () {
        $("#hiddenPassword").hide();
        $("#hiddenIdCard").hide();
        $("#realPassword").show();
        $("#realIdCard").show();
    });
</script>
</html>
