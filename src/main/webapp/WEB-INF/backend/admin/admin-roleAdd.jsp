<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>角色添加</title>
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
                    <input type="text" id="roleName" name="roleName" autocomplete="off" class="layui-input">
                    <i style="position: absolute;top: 8px;left: 165px;font-size: 20px;color: #5FB878;" id="roleNameOk" hidden class="layui-icon layui-icon-ok-circle"></i>
                    <i style="position: absolute;top: 8px;left: 165px;font-size: 20px;color: red" id="roleNameClose" hidden class="layui-icon layui-icon-close-fill"></i>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>角色名唯一
                </div>
            </div>
            <div class="layui-form-item">
                <label for="roleAuth" class="layui-form-label">
                    <span class="x-red">*</span>权限规则</label>
                <div class="layui-input-inline">
                    <input type="text" id="roleAuth" name="roleAuth" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="desc" class="layui-form-label">
                    <span class="x-red">*</span>描述</label>
                <div class="layui-input-inline">
                    <textarea placeholder="请输入内容" class="layui-textarea" name="desc" id="desc" style="width: 400px"></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">是否启用</label>
                <div class="layui-input-block">
                    <input type="radio" name="status" value="1" title="是" checked>
                    <input type="radio" name="status" value="0" title="否">
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 110px">
                <button type="button" style="width: 86px" class="layui-btn" onclick="addRole();">添加</button>
                <button type="reset" style="width: 86px" class="layui-btn layui-btn-normal">重置</button>
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
    //检查登录名是否重复(用户添加时)
    $("input[name='roleName']").blur(function () {
        var roleName = $("input[name='roleName']").val();

        $.ajax({
            url: contextPath + "/admin/verifyRoleName",
            method: "post",
            data:{
                roleName:roleName
            },
            success(jsonStr){
                var result = eval("(" + jsonStr + ")");
                if (result.status == 2){
                    $("#roleNameClose").hide();
                    $("#roleNameOk").show();
                }else{
                    $("#roleNameOk").hide();
                    $("#roleNameClose").show();
                }
            }
        })
    });
</script>
</body>
</html>
