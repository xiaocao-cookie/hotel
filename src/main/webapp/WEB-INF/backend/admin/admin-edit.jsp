<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>修改管理员信息</title>
</head>
<%@include file="../../common/common.jsp"%>
<body>
<div class="layui-fluid">
    <div class="layui-row">
        <form class="layui-form">
            <div class="layui-form-item">
                <label for="loginName" class="layui-form-label">
                    <span class="x-red">*</span>登录名</label>
                <div class="layui-input-inline">
                    <input type="text" id="loginName" value="${loginName}" name="loginName" required autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="password" class="layui-form-label">
                    <span class="x-red">*</span>密码</label>
                <div class="layui-input-inline">
                    <input type="password" id="password" value="${password}"  name="password" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">
                    <span class="x-red">*</span>性别</label>
                <div class="layui-input-inline">
                    <input type="radio" name="sex" value="0" title="男" <c:if test="${sex == 0}">checked</c:if>><div class="layui-unselect layui-form-radio layui-form-radioed"><i class="layui-anim layui-icon"></i><div>男</div></div>
                    <input type="radio" name="sex" value="1" title="女" <c:if test="${sex == 1}">checked</c:if>><div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i><div>女</div></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">
                    <span class="x-red">*</span>身份证号</label>
                <div class="layui-input-inline">
                    <input name="idCard" type="text" value="${idCard}" id="idCard" required autocomplete="off" class="layui-input" >
                </div>
            </div>
            <div class="layui-form-item">
                <label for="userType" class="layui-form-label">用户类型</label>
                <div class="layui-input-inline">
                    <select id="userType" name="userType">
                        <option value=""></option>
                        <option value="0" <c:if test="${userType == 0}">selected</c:if>>管理员</option>
                        <option value="1" <c:if test="${userType == 1}">selected</c:if>>员工</option>
                        <option value="2" <c:if test="${userType == 2}">selected</c:if>>租客</option>
                    </select>
                </div>
            </div>
            <input hidden name="userId" value="${id}">
            <div class="layui-form-item" style="margin-left: 110px">
                <button type="button" style="width: 86px" class="layui-btn" onclick="updateUser();">确认修改</button>
            </div>
        </form>
    </div>
</div>
<script>
    layui.use(['form', 'layer','jquery'],
        function() {
            $ = layui.jquery;
            var form = layui.form
        });

</script>
</body>
</html>
