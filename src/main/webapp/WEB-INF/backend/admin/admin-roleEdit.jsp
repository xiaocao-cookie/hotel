<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>修改角色信息</title>
</head>
<%@include file="../../common/common.jsp"%>
<body>
<div class="layui-fluid">
    <div class="layui-row">
        <form class="layui-form">
            <div class="layui-form-item">
                <label for="roleName" class="layui-form-label">
                    <span class="x-red">*</span>角色名</label>
                <div class="layui-input-inline">
                    <input type="text" id="roleName" value="${role.roleName}" name="roleName" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="roleAuth" class="layui-form-label">
                    <span class="x-red">*</span>权限规则</label>
                <div class="layui-input-inline">
                    <input type="text" id="roleAuth" value="${role.roleAuth}" name="roleAuth" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="desc" class="layui-form-label">
                    <span class="x-red">*</span>描述</label>
                <div class="layui-input-inline">
                    <textarea placeholder="请输入内容" class="layui-textarea" name="desc" id="desc" style="width: 400px">${role.desc}</textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">是否启用</label>
                <div class="layui-input-block">
                    <input type="radio" name="status" value="1" title="是" <c:if test="${role.status == 1}">checked</c:if>>
                    <input type="radio" name="status" value="0" title="否" <c:if test="${role.status == 0}">checked</c:if>>
                </div>
            </div>
            <input hidden value="${role.id}" id="roleId">
            <div class="layui-form-item" style="margin-left: 110px">
                <button type="button" style="width: 86px" class="layui-btn" onclick="updateRole();">修改</button>
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
