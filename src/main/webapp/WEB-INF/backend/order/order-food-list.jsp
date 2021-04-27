<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>菜品列表</title>
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
                            <th>菜品名</th>
                            <th>菜品星级</th>
                            <th>预订者</th>
                            <th>预订数量</th>
                            <th>总金额</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${foodOrderList}" var="foodOrder">
                            <tr>
                                <td>${foodOrder.id}</td>
                                <td>${foodOrder.food.name}</td>
                                <td>
                                    <c:forEach var="i" begin="1" step="1" end="${foodOrder.food.stars}">
                                        <i class="layui-icon layui-icon-rate-solid" style="font-size: 20px;color: #FF5722"></i>
                                    </c:forEach>
                                    <c:forEach var="i" begin="${foodOrder.food.stars}" step="1" end="4">
                                        <i class="layui-icon layui-icon-rate" style="font-size: 20px;color: #FF5722"></i>
                                    </c:forEach>
                                </td>
                                <td>${foodOrder.user.loginName}</td>
                                <td>${foodOrder.quantity}</td>
                                <td>￥ ${foodOrder.cost}</td>
                                <td class="td-manage">
                                    <a title="删除" onclick="delFoodOrder(this,${foodOrder.id})" href="javascript:;">
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
        location.href = contextPath +"/order/queryPageFoodOrders?currentPage="+pageCount;
    }
</script>
</body>
</html>
