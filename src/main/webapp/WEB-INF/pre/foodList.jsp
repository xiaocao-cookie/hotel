<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>食品推荐</title>
</head>
<%@include file="../common/common.jsp"%>
<body>
<%@include file="../common/header.jsp"%>
<%--餐品展示及选餐--%>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
    <legend>选餐</legend>
</fieldset>
<div class="site-demo-flow" id="laydemo1">
    <c:forEach items="${foodList}" var="food">
        <a href="#" style="position: relative" id="foodSection">
            <img src="${ctx}/statics/images/${food.picPath}" id="foodImg" style="width: 500px;height: 350px;">
            <c:forEach var="i" begin="1" step="1" end="${food.stars}">
                <i class="layui-icon layui-icon-rate-solid" style="color: #FF5722;font-size: 20px;position:absolute;top: 110px;left: calc(115px + 20*${i}px)"></i>
            </c:forEach>
            <c:forEach var="i" begin="${food.stars}" step="1" end="4">
                <i class="layui-icon layui-icon-rate" style="font-size: 20px;position: absolute;top: 110px;left: calc(115px + 20*${i+1}px);"></i>
            </c:forEach>
            <span>${food.name}&nbsp;&nbsp;￥${food.price}</span>
            <button class="layui-btn layui-btn-lg layui-btn-danger" onclick="xadmin.open('订单信息','../order/toOrderFood?id='+${food.id},600,520)">预订</button>
        </a>
    </c:forEach>
</div>
</body>
</html>
