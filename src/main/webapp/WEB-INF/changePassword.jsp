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
    <title>修改密码</title>
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
<div class="login layui-anim layui-anim-up" style="margin-top: 85px">
    <div class="message">Hotel - 修改密码</div>
    <div id="darkbannerwrap"></div>
    <form class="layui-form">
        <input name="oldPassword" placeholder="原密码"  type="password" class="layui-input" >
        <hr class="hr15">
        <input name="newPassword" placeholder="新密码"  type="password" class="layui-input" >
        <hr class="hr15">
        <input name="reNewPassword" placeholder="确认新密码"  type="password" class="layui-input" >
        <hr class="hr15">
        <input value="修改密码" lay-submit lay-filter="login" style="width:100%;" type="button" onclick="changePassword();">
        <hr class="hr20" >
    </form>
</div>
</body>
<script>
    layui.use('form', function(){
        var form = layui.form;
    });
    function changePassword() {
        var oldPassword = $("input[name='oldPassword']").val();
        var newPassword = $("input[name='newPassword']").val();
        var reNewPassword = $("input[name='reNewPassword']").val();
        var password = ${sessionScope.loginUser.password};
        var id = ${sessionScope.loginUser.id};

        if (password != oldPassword){
            layer.msg('原密码不正确',
                {icon: 2,
                 time:2000},
                function () {
                    window.location.reload();
                });
            return;
        }

        if (newPassword == null || newPassword == ""){
            layer.msg('密码框不能为空',
                {icon: 5,
                 time:2000},
                function () {
                    window.location.reload();
                });
            return;
        }

        if (oldPassword == newPassword){
            layer.msg('新密码与原密码不能相同',
                {icon: 5,
                 time:2000},
                function () {
                    window.location.reload();
                });
            return;
        }

        if (newPassword != reNewPassword){
            layer.msg('两次输入密码不一致',{
                icon: 5,
                time: 2000
            },function () {
                window.location.reload();
            });
            return;
        }

        $.ajax({
            url: contextPath + "/user/changePassword",
            method: "post",
            data: {
                newPassword: newPassword,
                id: id
            },
            success: function (jsonStr) {
                var result = eval("(" + jsonStr + ")");
                if (result.status == 1) {
                    layer.alert(result.message, function(){
                        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                        parent.layer.close(index); //再执行关闭
                        top.location.href = contextPath + "/Login/toLogin";
                    });
                } else {
                    layer.confirm(result.message, {icon: 3, title:'提示'}, function(index){
                        layer.close(index);
                        window.location.reload();
                    });
                }
            }
        })
    }
</script>
</html>