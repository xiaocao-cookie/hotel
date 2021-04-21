<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>通知列表</title>
</head>
<%@include file="../../common/common.jsp"%>
<body>
<div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="#"><cite>通知列表</cite></a>
          </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body">
                    <form class="layui-form layui-col-space5" method="post" action="${ctx}/notice/queryPageNotices">
                        <input hidden name="currentPageNo" value="${pager.currentPage}">
                        <div class="layui-inline">
                            <label for="sendName" class="layui-form-label">发送者</label>
                            <div class="layui-input-inline">
                                <select name="sendName" id="sendName">
                                    <option value="">-- 请选择 --</option>
                                    <c:forEach items="${userList}" var="user">
                                        <option value="${user.id}" <c:if test="${sendUid == user.id}">selected</c:if>>${user.loginName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label for="content" class="layui-form-label">内容</label>
                            <div class="layui-input-inline">
                                <input type="text" class="layui-input" name="content" value="<%=request.getParameter("content") == null ? "" : request.getParameter("content") %>" id="content">
                            </div>
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <button type="submit" class="layui-btn"><i class="layui-icon">&#xe615;</i></button>
                        </div>
                    </form>
                </div>
                <div class="layui-card-header">
                    <button class="layui-btn" onclick="xadmin.open('发布通知','../notice/toAddNotice?id='+${sessionScope.loginUser.id},800,520)"><i class="layui-icon"></i>发布通知</button>
                </div>
                <div class="layui-card-body layui-table-body layui-table-main">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>发起者</th>
                            <th>内容</th>
                            <th>接收者</th>
                            <th>创建时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${noticeList}" var="notice">
                                <tr>
                                    <td>${notice.id}</td>
                                    <td>${notice.sendName}</td>
                                    <td>${notice.content}</td>
                                    <td>${notice.receiveName}</td>
                                    <td><fmt:formatDate value="${notice.time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    <td class="td-manage">
                                        <a title="编辑"  onclick="xadmin.open('编辑','../notice/toUpdateNotice?id='+${notice.id},650,520)" href="javascript:;">
                                            <button class="layui-btn layui-btn-normal">编辑</button>
                                        </a>
                                        <a title="删除" onclick="delNotice(this,${notice.id})" href="javascript:;">
                                            <button class="layui-btn layui-btn-warm">删除</button>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                        <c:if test="${noticeList.size() == 0}">
                            <tbody>暂无记录</tbody>
                        </c:if>
                    </table>
                </div>
                <div class="layui-card-body">
                    <%@include file="../../common/pageBar.jsp"%>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    layui.use('form', function() {
        var form = layui.form
    });

    //分页跳转
    function jump(pageCount) {
        var content = $("input[name='content']").val();
        var sendName = $("#sendName option:selected").val();
        location.href = contextPath +"/notice/queryPageNotices?currentPage="+pageCount+"&sendName="+sendName+"&content="+content;
    }
</script>
</html>
