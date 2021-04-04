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
<%@include file="../common/common.jsp"%>
<body>
<div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="#"><cite>菜品列表</cite></a>
          </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body">
                    <form class="layui-form layui-col-space5" action="${ctx}/food/queryPageFoods">
                        <input hidden name="currentPageNo" value="${pager.currentPage}">
                        <div class="layui-inline">
                            <label for="foodName" class="layui-form-label">菜品名</label>
                            <div class="layui-input-inline">
                                <input type="text" id="foodName" name="foodName" value="<%=request.getParameter("foodName")== null ? "":request.getParameter("foodName")%>" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">范围</label>
                            <div class="layui-input-inline">
                                <input type="text" name="minPrice" placeholder="￥" value="<%=request.getParameter("minPrice")== null ? "":request.getParameter("minPrice")%>" autocomplete="off" class="layui-input" style="width: 100px">
                            </div>-
                            <div class="layui-input-inline">
                                <input type="text" name="maxPrice" placeholder="￥" value="<%=request.getParameter("maxPrice")== null ? "":request.getParameter("maxPrice")%>" autocomplete="off" class="layui-input" style="width: 100px">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label for="stars" class="layui-form-label">菜品星级</label>
                            <div class="layui-input-inline">
                                <select name="stars" id="stars">
                                    <option value="">-- 请选择 --</option>
                                    <option value="1" <c:if test="${stars == 1}">selected</c:if>>一星级</option>
                                    <option value="2" <c:if test="${stars == 2}">selected</c:if>>二星级</option>
                                    <option value="3" <c:if test="${stars == 3}">selected</c:if>>三星级</option>
                                    <option value="4" <c:if test="${stars == 4}">selected</c:if>>四星级</option>
                                    <option value="5" <c:if test="${stars == 5}">selected</c:if>>五星级</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <button type="submit" class="layui-btn"><i class="layui-icon">&#xe615;</i></button>
                        </div>
                    </form>
                </div>
                <div class="layui-card-header">
                    <button class="layui-btn" onclick="xadmin.open('添加菜品','../food/toAddFood',600,520)"><i class="layui-icon"></i>添加菜品</button>
                </div>
                <div class="layui-card-body layui-table-body layui-table-main">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>菜品名称</th>
                            <th>菜品价格</th>
                            <th>菜品图片</th>
                            <th>星级</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${foodList}" var="food">
                            <tr>
                                <td>${food.id}</td>
                                <td>${food.name}</td>
                                <td>￥${food.price}.00</td>
                                <td>
                                    <img src="${ctx}/statics/images/${food.picPath}" style="width: 80px;height: 60px">
                                </td>
                                <td>
                                    <c:forEach var="i" begin="1" step="1" end="${food.stars}">
                                        <i class="layui-icon layui-icon-rate-solid" style="font-size: 20px;color: #FF5722"></i>
                                    </c:forEach>
                                    <c:forEach var="i" begin="${food.stars}" step="1" end="4">
                                        <i class="layui-icon layui-icon-rate" style="font-size: 20px;color: #FF5722"></i>
                                    </c:forEach>
                                </td>
                                <td class="td-manage">
                                    <a title="编辑"  onclick="xadmin.open('编辑','member-edit.html',600,520)" href="javascript:;">
                                        <button class="layui-btn layui-btn-normal">编辑</button>
                                    </a>
                                    <a title="删除" onclick="delFood(this,${food.id})" href="javascript:;">
                                        <button class="layui-btn layui-btn-warm">删除</button>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="layui-card-body">
                    <%@include file="../common/pageBar.jsp"%>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    layui.use('form', function() {
        var form = layui.form;
    });

    //分页跳转
    function jump(pageCount) {
        var foodName = $("input[name='foodName']").val();
        var minPrice = $("input[name='minPrice']").val();
        var maxPrice = $("input[name='maxPrice']").val();
        var stars = $("#stars option:selected").val();
        location.href = contextPath +"/food/queryPageFoods?currentPage="+pageCount+"&foodName="+foodName+"&minPrice="+minPrice+"&maxPrice="+maxPrice+"&stars="+stars;
    }
</script>
</html>
