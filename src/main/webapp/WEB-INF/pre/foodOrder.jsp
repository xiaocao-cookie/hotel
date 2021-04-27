<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>食品订单</title>
</head>
<%@include file="../common/common.jsp"%>
<body>
<div class="layui-fluid">
    <div class="layui-row">
        <form class="layui-form">
            <div class="layui-form-item">
                <label for="foodName" class="layui-form-label">菜品名称</label>
                <div class="layui-input-inline">
                    <input type="text" id="foodName" value="${food.name}" name="foodName" class="layui-input" disabled>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">菜品图片</label>
                <div class="layui-input-inline">
                    <img src="${ctx}/statics/images/${food.picPath}" class="layui-upload-img" style="width: 120px;height: 100px;">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="star" class="layui-form-label">菜品星级</label>
                <div class="layui-input-inline">
                    <input id="star" class="layui-input" type="text" disabled
                        <c:if test="${food.stars == 1}">value="一星级"</c:if>
                        <c:if test="${food.stars == 2}">value="二星级"</c:if>
                        <c:if test="${food.stars == 3}">value="三星级"</c:if>
                        <c:if test="${food.stars == 4}">value="四星级"</c:if>
                        <c:if test="${food.stars == 5}">value="五星级"</c:if>
                    >
                </div>
            </div>
            <div class="layui-form-item">
                <label for="quantity" class="layui-form-label">
                    <span class="x-red">*</span>所需数量</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" value="1" id="quantity">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="price" class="layui-form-label">
                    <span class="x-red">*</span>菜品价格</label>
                <div class="layui-input-inline">
                    <input disabled type="text" class="layui-input" value="￥${food.price}" id="price">
                    <input id="initPrice" value="${food.price}" hidden>
                </div>
            </div>
            <input hidden id="foodId" value="${food.id}">
            <button type="button" class="layui-btn layui-btn-lg layui-btn-danger" style="margin-left: 30px" id="orderRoom"
                    onclick="orderFood(${sessionScope.loginUser.id});">确定并支付</button>
            <button type="button" class="layui-btn layui-btn-lg layui-btn-normal" style="margin-left: 30px" id="cancel"
                    onclick="xadmin.close()">取消订单</button>
        </form>
    </div>
</div>
<script>
    //确保表单样式
    layui.use(['form', 'layer','jquery'],
        function() {
            $ = layui.jquery;
            var form = layui.form
        });
    $("#quantity").blur(function () {
        var quantity = $("#quantity").val();
        var initPrice = $("#initPrice").val();
        $("#price").val("￥ "+initPrice+" x "+quantity+" = "+initPrice*quantity);
    });
</script>
</body>
</html>
