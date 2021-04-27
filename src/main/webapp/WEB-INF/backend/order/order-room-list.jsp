<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>订单管理</title>
</head>
<%@include file="../../common/common.jsp"%>
<body>
<div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="#"><cite>信息展示</cite></a>
          </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <%--  数据表格  --%>
                <div class="layui-card-body layui-table-body layui-table-main">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>
                            <th>订单号</th>
                            <th>房间号</th>
                            <th>房间名</th>
                            <th>房间类型</th>
                            <th>租赁者</th>
                            <th>租期</th>
                            <th>缴纳金额</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${roomOrderList}" var="roomOrder">
                            <tr>
                                <td>${roomOrder.id}</td>
                                <td>${roomOrder.room.rno}</td>
                                <td>${roomOrder.room.rname}</td>
                                <td>
                                    <c:if test="${roomOrder.room.rtype == 0}">单人间</c:if>
                                    <c:if test="${roomOrder.room.rtype == 1}">大床房</c:if>
                                    <c:if test="${roomOrder.room.rtype == 2}">双人间</c:if>
                                    <c:if test="${roomOrder.room.rtype == 3}">三人间</c:if>
                                    <c:if test="${roomOrder.room.rtype == 4}">套房</c:if>
                                </td>
                                <td>${roomOrder.user.loginName}</td>
                                <td>
                                    <fmt:formatDate value="${roomOrder.startTime}" pattern="yyyy-MM-dd"/>
                                    -
                                    <fmt:formatDate value="${roomOrder.endTime}" pattern="yyyy-MM-dd"/>
                                </td>
                                <td>￥ ${roomOrder.cost}</td>
                                <td class="td-manage">
                                    <a title="删除" onclick="delRoomOrder(this,${roomOrder.id})" href="javascript:;">
                                        <button class="layui-btn layui-btn-warm">删除</button>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <%--  分页  --%>
                <div class="layui-card-body">
                    <%@include file="../../common/pageBar.jsp"%>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    //分页跳转
    function jump(pageCount) {
        location.href = contextPath +"/order/queryPageRoomOrders?currentPage="+pageCount;
    }
</script>
</body>
</html>
