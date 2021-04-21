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
                <div class="layui-card-body">
                    <%--  条件选择表单  --%>
                    <form class="layui-form layui-col-space5" action="${ctx}/Room/queryPageRooms">
                        <input hidden name="currentPageNo" value="${pager.currentPage}">
                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" id="roomName" name="roomName" value="<%=request.getParameter("roomName")== null ? "":request.getParameter("roomName")%>"  placeholder="请输入房间名" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <select name="roomType" id="roomType">
                                <option value="">房间类型</option>
                                <option value="0" <c:if test="${roomType == 0}">selected</c:if>>单人间</option>
                                <option value="1" <c:if test="${roomType == 1}">selected</c:if>>大床房</option>
                                <option value="2" <c:if test="${roomType == 2}">selected</c:if>>二人间</option>
                                <option value="3" <c:if test="${roomType == 3}">selected</c:if>>三人间</option>
                                <option value="4" <c:if test="${roomType == 4}">selected</c:if>>套房</option>
                            </select>
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <select name="status" id="status">
                                <option value="">房间状态</option>
                                <option value="未预订" <c:if test="${status == '未预订'}">selected</c:if>>未预订</option>
                                <option value="已预订" <c:if test="${status == '已预订'}">selected</c:if>>已预订</option>
                                <option value="脏房" <c:if test="${status == '脏房'}">selected</c:if>>脏房</option>
                                <option value="已租" <c:if test="${status == '已租'}">selected</c:if>>已租</option>
                            </select>
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <select name="roomStyle" id="roomStyle">
                                <option value="">装修风格</option>
                                <option value="现代风格" <c:if test="${roomStyle == '现代风格'}">selected</c:if>>现代风格</option>
                                <option value="欧式风格" <c:if test="${roomStyle == '欧式风格'}">selected</c:if>>欧式风格</option>
                                <option value="工业风格" <c:if test="${roomStyle == '工业风格'}">selected</c:if>>工业风格</option>
                                <option value="中式风格" <c:if test="${roomStyle == '中式风格'}">selected</c:if>>中式风格</option>
                                <option value="北欧风格" <c:if test="${roomStyle == '北欧风格'}">selected</c:if>>北欧风格</option>
                            </select>
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <button type="submit" class="layui-btn"><i class="layui-icon">&#xe615;</i></button>
                        </div>
                    </form>
                </div>
                <div class="layui-card-header">
                    <button class="layui-btn" onclick="xadmin.open('添加房间','../Room/toAddRoom',600,520)"><i class="layui-icon"></i>添加房间</button>
                </div>
                <%--  数据表格  --%>
                <div class="layui-card-body layui-table-body layui-table-main">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>
                            <th>房间号</th>
                            <th>房间名</th>
                            <th>房间类型</th>
                            <th>房间状态</th>
                            <th>装修风格</th>
                            <th>楼层</th>
                            <th>操作</th></tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${roomList}" var="room">
                            <tr>
                                <td>${room.rno}</td>
                                <td>${room.rname}</td>
                                <td>
                                    <c:if test="${room.rtype == 0}">单人间</c:if>
                                    <c:if test="${room.rtype == 1}">大床房</c:if>
                                    <c:if test="${room.rtype == 2}">双人间</c:if>
                                    <c:if test="${room.rtype == 3}">三人间</c:if>
                                    <c:if test="${room.rtype == 4}">套房</c:if>
                                </td>
                                <td>${room.status}</td>
                                <td>${room.rstyle}</td>
                                <td>
                                    <c:if test="${room.rfloor == 1}">一层</c:if>
                                    <c:if test="${room.rfloor == 2}">二层</c:if>
                                    <c:if test="${room.rfloor == 3}">三层</c:if>
                                </td>
                                <td class="td-manage">
                                    <a title="编辑"  onclick="xadmin.open('编辑','../Room/toUpdateRoom?rno='+${room.rno},600,520)" href="javascript:;">
                                        <button class="layui-btn layui-btn-normal">编辑</button>
                                    </a>
                                    <a title="删除" onclick="delRoom(this,${room.rno})" href="javascript:;">
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
        var roomName = $("#roomName").val();
        var roomType = $("#roomType option:selected").val();
        var status = $("#status option:selected").val();
        var roomStyle = $("#roomStyle option:selected").val();
        location.href = contextPath +"/Room/queryPageRooms?currentPage="+pageCount+"&roomName="+roomName+"&roomType="+roomType+"&status="+status+"&roomStyle="+roomStyle;
    }

    layui.use(['laydate','form'], function(){
        var laydate = layui.laydate;
        var  form = layui.form;

        // 监听全选
        form.on('checkbox(checkall)', function(data){

            if(data.elem.checked){
                $('tbody input').prop('checked',true);
            }else{
                $('tbody input').prop('checked',false);
            }
            form.render('checkbox');
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });
    });
</script>
</body>
</html>
