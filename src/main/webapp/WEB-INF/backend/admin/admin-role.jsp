<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>用户角色列表</title>
</head>
<%@include file="../../common/common.jsp"%>
<body>
<div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="#"><cite>用户角色</cite></a>
          </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">
                    <button class="layui-btn" onclick="xadmin.open('添加角色','../admin/toAddRole',600,500)"><i class="layui-icon"></i>添加</button>
                </div>
                <div class="layui-card-body ">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>角色名</th>
                            <th>拥有权限规则</th>
                            <th>描述</th>
                            <th>状态</th>
                            <th>操作</th>
                        </thead>
                        <tbody>
                        <c:forEach items="${roleList}" var="role">
                        <tr>
                            <td>${role.id}</td>
                            <td>${role.roleName}</td>
                            <td>${role.roleAuth}</td>
                            <td>${role.desc}</td>
                            <td class="td-status">
                                <c:if test="${role.status == 1}">
                                    <span class="layui-btn layui-btn-mini">已启用</span>
                                </c:if>
                                <c:if test="${role.status == 0}">
                                    <span class="layui-btn layui-btn-disabled layui-btn-mini">已停用</span>
                                </c:if>
                                <a onclick="role_stop(this,'${role.status == 0?'启用':'停用'}',${role.id})" href="javascript:;">
                                    <i class="layui-icon">&#xe601;</i>
                                </a>
                            </td>
                            <td class="td-manage">
                                <a title="编辑"  onclick="xadmin.open('编辑','../admin/toUpdateRole?id='+${role.id},600,520)" href="javascript:;">
                                    <button class="layui-btn layui-btn-normal">编辑</button>
                                </a>
                                <a title="删除" onclick="delRole(this,${role.id})" href="javascript:;">
                                    <button class="layui-btn layui-btn-warm">删除</button>
                                </a>
                            </td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="layui-card-body ">
                    <%@include file="../../common/pageBar.jsp"%>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    layui.use('form', function(){
        var form = layui.form;
    });
</script>
</html>
