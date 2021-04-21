<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>房间列表</title>
</head>
<%@include file="../common/common.jsp"%>
<body>
<%@include file="../common/header.jsp"%>
<%--  查询条件  --%>
<form class="layui-form" method="post" action="${ctx}/Home/queryLikeRoom">
    <input hidden value="${menu}" name="id">
    <br><br>
    <span style="margin-left: 60px;font-size: x-large;color: #1dc8cd">房间筛选</span>
    <div class="layui-inline">
        <label class="layui-form-label" style="font-size: large">楼层</label>
        <div class="layui-input-inline">
            <select name="floor" lay-verify="required" lay-search="">
                <option value="">请选择</option>
                <option value="1">一层</option>
                <option value="2">二层</option>
                <option value="3">三层</option>
            </select>
        </div>
    </div>
    <div class="layui-inline">
        <label class="layui-form-label" style="font-size: large;padding-left: 0">房态</label>
        <div class="layui-input-inline">
            <select name="status" lay-verify="required" lay-search="">
                <option value="">请选择</option>
                <option value="未预订">未预订</option>
                <option value="已预订">已预订</option>
                <option value="脏房">脏房</option>
                <option value="已租">已租</option>
            </select>
        </div>
    </div>
    <div class="layui-inline">
        <label class="layui-form-label" style="font-size: large;padding-left: 30px">装修风格</label>
        <div class="layui-input-inline">
            <select name="style" lay-verify="required" lay-search="">
                <option value="">请选择</option>
                <option value="中式风格">中式风格</option>
                <option value="现代风格">现代风格</option>
                <option value="北欧风格">北欧风格</option>
                <option value="欧式风格">欧式风格</option>
                <option value="工业风格">工业风格</option>
            </select>
        </div>
    </div>
    <div class="layui-inline">
        <button type="submit" class="layui-btn layui-btn-normal" style="font-size: large;width: 120px;margin-left: 30px">查询</button>
    </div>
</form>
<hr class="layui-bg-blue">
<table id="roomTable">
    <c:forEach begin="0" step="1" end="${roomList.size()/3}" var="i">
        <tr>
            <c:forEach items="${roomList}" var="room" begin="${3*i}" step="1" end="${3*i}">
                <td>
                    <img src="${ctx}/statics/images/${room.picPath}" style="width: 380px;height: 270px"><br>
                    房间号：&nbsp;${room.rno}<br/>
                    房间名称：&nbsp;${room.rname}<br>
                    房间类型：
                    <c:if test="${room.rtype == 0}">单人间</c:if>
                    <c:if test="${room.rtype == 1}">大床房</c:if>
                    <c:if test="${room.rtype == 2}">双人间</c:if>
                    <c:if test="${room.rtype == 3}">三人间</c:if>
                    <c:if test="${room.rtype == 4}">套房</c:if><br/>
                    房间状态：&nbsp;${room.status}<br>
                    房间风格：&nbsp;${room.rstyle}<br/>
                    所在楼层：&nbsp;
                        <c:if test="${room.rfloor == 1}">一层</c:if>
                        <c:if test="${room.rfloor == 2}">二层</c:if>
                        <c:if test="${room.rfloor == 3}">三层</c:if><br/>
                    <span style="font-size: large">CNY:￥${room.price}.00</span>
                    <a href="#">
                        <button type="button" class="layui-btn layui-btn-lg layui-btn-danger" id="toPayRoom1">立即预订</button>
                    </a>
                </td>
            </c:forEach>
            <c:forEach items="${roomList}" var="room" begin="${3*i+1}" step="1" end="${3*i+1}">
                <td>
                    <img src="${ctx}/statics/images/${room.picPath}" style="width: 380px;height: 270px"><br>
                    房间号：&nbsp;${room.rno}<br/>
                    房间名称：&nbsp;${room.rname}<br>
                    房间类型：
                    <c:if test="${room.rtype == 0}">单人间</c:if>
                    <c:if test="${room.rtype == 1}">大床房</c:if>
                    <c:if test="${room.rtype == 2}">双人间</c:if>
                    <c:if test="${room.rtype == 3}">三人间</c:if>
                    <c:if test="${room.rtype == 4}">套房</c:if><br/>
                    房间状态：&nbsp;${room.status}<br>
                    房间风格：&nbsp;${room.rstyle}<br/>
                    所在楼层：&nbsp;
                    <c:if test="${room.rfloor == 1}">一层</c:if>
                    <c:if test="${room.rfloor == 2}">二层</c:if>
                    <c:if test="${room.rfloor == 3}">三层</c:if><br/>
                    <span style="font-size: large">CNY:￥${room.price}.00</span>
                    <a href="#">
                        <button type="button" class="layui-btn layui-btn-lg layui-btn-danger" id="toPayRoom2">立即预订</button>
                    </a>
                </td>
            </c:forEach>
            <c:forEach items="${roomList}" var="room" begin="${3*i+2}" step="1" end="${3*i+2}">
                <td>
                    <img src="${ctx}/statics/images/${room.picPath}" style="width: 380px;height: 270px"><br>
                    房间号：&nbsp;${room.rno}<br/>
                    房间名称：&nbsp;${room.rname}<br>
                    房间类型：
                    <c:if test="${room.rtype == 0}">单人间</c:if>
                    <c:if test="${room.rtype == 1}">大床房</c:if>
                    <c:if test="${room.rtype == 2}">双人间</c:if>
                    <c:if test="${room.rtype == 3}">三人间</c:if>
                    <c:if test="${room.rtype == 4}">套房</c:if><br/>
                    房间状态：&nbsp;${room.status}<br>
                    房间风格：&nbsp;${room.rstyle}<br/>
                    所在楼层：&nbsp;
                    <c:if test="${room.rfloor == 1}">一层</c:if>
                    <c:if test="${room.rfloor == 2}">二层</c:if>
                    <c:if test="${room.rfloor == 3}">三层</c:if><br/>
                    <span style="font-size: large">CNY:￥${room.price}.00</span>
                    <a href="#">
                        <button type="button" class="layui-btn layui-btn-lg layui-btn-danger" id="toPayRoom3">立即预订</button>
                    </a>
                </td>
            </c:forEach>
        </tr>
    </c:forEach>
</table>
</body>
<script>
    layui.use(['form'], function(){
        var form = layui.form;
    })
</script>
</html>
