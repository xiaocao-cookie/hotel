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
    <div class="message">Hotel - 找回密码</div>
    <div id="darkbannerwrap"></div>
    <form method="post" class="layui-form">
        <input name="param" placeholder="请输入身份证号或登录名"  type="text" class="layui-input" >
        <hr class="hr15">
        <input value="立即找回" lay-submit lay-filter="register" style="width:100%;" type="button" onclick="findPassword();">
        <hr class="hr20">
    </form>
    <a href="${ctx}/Register/toRegister" style="text-decoration: underline;color: #00A195">去注册>></a>
    <a href="${ctx}/Login/toLogin"><span style="text-decoration: underline;margin-left: 235px">立即登录</span></a>
</div>
</body>
<script>
    layui.use('form', function(){
        var form = layui.form;
    });
    function findPassword() {
        var param = $("input[name='param']").val();

        if (param == null || param == ""){
            layer.msg('查询条件不能为空', {
                icon: 2,
                time: 1000
            }, function(){
                //do something
            });
            return;
        }

        $.ajax({
            url: contextPath+"/user/findPassword",
            method: "post",
            data: {
                param: param
            },
            success: function (jsonStr) {
                var result = eval("(" + jsonStr + ")");
                if (result.status == 1) {
                    layer.open({
                        content: "您的密码为："+result.message
                    });
                } else {
                    layer.alert('您未注册哦！点击确定并注册',{icon: 6},
                        function(index){
                            layer.close(index);
                            window.location.href = contextPath+"/Register/toRegister";
                        });

                }
            }

        })
    }
</script>
</html>