<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>添加用户</title>
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
                    <input type="text" id="loginName" name="loginName" required autocomplete="off" class="layui-input">
                    <i style="position: absolute;top: 8px;left: 165px;font-size: 20px;color: #5FB878;" id="loginNameOk" hidden class="layui-icon layui-icon-ok-circle"></i>
                    <i style="position: absolute;top: 8px;left: 165px;font-size: 20px;color: red" id="loginNameClose" hidden class="layui-icon layui-icon-close-fill"></i>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>将会成为您唯一的登入名
                </div>
            </div>
            <div class="layui-form-item">
                <label for="password" class="layui-form-label">
                    <span class="x-red">*</span>密码</label>
                <div class="layui-input-inline">
                    <input type="password" id="password" name="password" required="" lay-verify="pass" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="rePassword" class="layui-form-label">
                    <span class="x-red">*</span>确认密码</label>
                <div class="layui-input-inline">
                    <input type="password" id="rePassword" name="rePassword" required="" lay-verify="repass" autocomplete="off" class="layui-input"></div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">
                    <span class="x-red">*</span>性别</label>
                <div class="layui-input-inline">
                    <input type="radio" name="sex" value="0" title="男" checked><div class="layui-unselect layui-form-radio layui-form-radioed"><i class="layui-anim layui-icon"></i><div>男</div></div>
                    <input type="radio" name="sex" value="1" title="女"><div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i><div>女</div></div>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">
                    <span class="x-red">*</span>身份证号</label>
                <div class="layui-input-inline">
                    <input name="idCard" type="text" id="idCard" required autocomplete="off" class="layui-input" >
                    <i style="position: absolute;top: 8px;left: 165px;font-size: 20px;color: #5FB878;" id="idCardOk" hidden class="layui-icon layui-icon-ok-circle"></i>
                    <i style="position: absolute;top: 8px;left: 165px;font-size: 20px;color: red;" id="idCardClose" hidden class="layui-icon layui-icon-close-fill"></i>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">用户类型</label>
                <div class="layui-input-inline">
                    <select name="userType">
                        <option value=""></option>
                        <option value="0">管理员</option>
                        <option value="1">员工</option>
                        <option value="2">租客</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 110px">
                <button type="button" style="width: 86px" class="layui-btn" onclick="addUser();">添加</button>
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
    $("input[name='loginName']").blur(function () {
        var loginName = $("input[name='loginName']").val();
        $.ajax({
            url: contextPath + "/Register/verifyLoginName",
            method: "post",
            data:{
                loginName:loginName
            },
            success(jsonStr){
                var result = eval("(" + jsonStr + ")");
                if (result.status == 2){
                    $("#loginNameClose").hide();
                    $("#loginNameOk").show();
                }else{
                    $("#loginNameOk").hide();
                    $("#loginNameClose").show();
                }
            }
        })
    });

    //检查身份证号是否重复(用户添加时)
    $("input[name='idCard']").blur(function () {
        var idCard = $("input[name='idCard']").val();
        $.ajax({
            url: contextPath + "/Register/verifyIdCard",
            method: "post",
            data:{
                idCard:idCard
            },
            success(jsonStr){
                var result = eval("(" + jsonStr + ")");
                if (result.status == 2){
                    $("#idCardClose").hide();
                    $("#idCardOk").show();
                }else{
                    $("#idCardOk").hide();
                    $("#idCardClose").show();
                }
            }
        })
    });
</script>
</body>
</html>
