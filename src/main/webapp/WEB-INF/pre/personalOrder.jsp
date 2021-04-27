<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>我的订单</title>
</head>
<%@include file="../common/common.jsp"%>
<body>
<%@include file="../common/header.jsp"%>
<div class="layui-col-md10 layui-col-md-offset1">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
        <legend>所订房间信息</legend>
    </fieldset>
    <c:forEach items="${roomOrderList}" var="roomOrder"  begin="0" end="0">
        <table class="layui-table" lay-size="lg" style="background-color: #d2d2d2">
            <colgroup>
                <col width="200">
                <col width="50">
            </colgroup>
            <tbody>
            <tr>
                <td>房间号</td>
                <td id="rno">${roomOrder.room.rno}</td>
            </tr>
            <tr>
                <td>房间名</td>
                <td id="rname">${roomOrder.room.rname}</td>
            </tr>
            <tr>
                <td>租赁日期</td>
                <td>
                    <div class="layui-inline">
                        <div class="layui-input-inline">
                            <input type="text" class="layui-input" id="startTime"
                                   value="<fmt:formatDate value="${roomOrder.startTime}" pattern="yyyy-MM-dd" />" disabled>
                        </div>
                        --
                        <div class="layui-input-inline">
                            <input type="text" class="layui-input" id="endTime"
                                   value="<fmt:formatDate value="${roomOrder.endTime}" pattern="yyyy-MM-dd" />" disabled>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>房间类型</td>
                <td id="rtype">
                    <c:if test="${roomOrder.room.rtype == 0}">单人间</c:if>
                    <c:if test="${roomOrder.room.rtype == 1}">大床房</c:if>
                    <c:if test="${roomOrder.room.rtype == 2}">双人间</c:if>
                    <c:if test="${roomOrder.room.rtype == 3}">三人间</c:if>
                    <c:if test="${roomOrder.room.rtype == 4}">套房</c:if>
                </td>
            </tr>
            <tr>
                <td>装修风格</td>
                <td id="style">${roomOrder.room.rstyle}</td>
            </tr>
            <tr>
                <td>所在楼层</td>
                <td id="floor">
                    <c:if test="${roomOrder.room.rfloor == 1}">一层</c:if>
                    <c:if test="${roomOrder.room.rfloor == 2}">二层</c:if>
                    <c:if test="${roomOrder.room.rfloor == 3}">三层</c:if>
                </td>
            </tr>
            <tr>
                <td>价格(单位：元)</td>
                <td id="price">￥ ${roomOrder.cost}</td>
            </tr>
            </tbody>
        </table>
        <br><br>
    </c:forEach>

    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
        <legend>所订菜品信息</legend>
    </fieldset>

    <c:forEach items="${foodOrderList}" var="foodOrder"  begin="0" end="0">
        <table class="layui-table" lay-size="lg">
            <colgroup>
                <col width="200">
                <col width="50">
            </colgroup>
            <tbody>
            <tr>
                <td>菜品名称</td>
                <td id="name">${foodOrder.food.name}</td>
            </tr>
            <tr>
                <td>菜品图片</td>
                <td id="img">
                    <img src="${ctx}/statics/images/${foodOrder.food.picPath}">
                </td>
            </tr>
            <tr>
                <td>菜品星级</td>
                <td id="stars">
                    <c:forEach var="i" begin="1" step="1" end="${foodOrder.food.stars}">
                        <i class="layui-icon layui-icon-rate-solid" style="font-size: 20px;color: #FF5722"></i>
                    </c:forEach>
                    <c:forEach var="i" begin="${foodOrder.food.stars}" step="1" end="4">
                        <i class="layui-icon layui-icon-rate" style="font-size: 20px;color: #FF5722"></i>
                    </c:forEach>
                </td>
            </tr>
            <tr>
                <td>所定菜品数量</td>
                <td>${foodOrder.quantity} 份</td>
            </tr>
            <tr>
                <td>菜品总价格(单位：元)</td>
                <td id="fprice">￥ ${foodOrder.cost}</td>
            </tr>
            </tbody>
        </table>
        <br><br>
    </c:forEach>
</div>
</body>
</html>
