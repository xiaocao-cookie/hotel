<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>房间订单详情页</title>
</head>
<%@include file="../common/common.jsp"%>
<body>
<%@include file="../common/header.jsp"%>
<div class="layui-col-md10 layui-col-md-offset1">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
        <legend>所订房间信息</legend>
    </fieldset>
    <c:forEach items="${roomOrderList}" var="roomOrder">
        <table class="layui-table" lay-size="lg">
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
            <tr>
                <td>操作</td>
                <c:if test="${menu == 1}">
                    <td><button type="button" class="layui-btn layui-btn-lg layui-btn-danger" id="cancelRoom"
                                onclick="cancelRoom(${roomOrder.rno});">我要退租</button></td>
                </c:if>
                <c:if test="${menu == 2}">
                    <td><button type="button" class="layui-btn layui-btn-lg layui-btn-danger" id="toRenewRoom"
                                onclick="xadmin.open('相关信息','../order/toRenewRoom?id='+${roomOrder.id});">我要续租</button></td>
                </c:if>
            </tr>
            </tbody>
        </table>
        <br><br>
    </c:forEach>
</div>
</body>
</html>
