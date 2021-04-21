<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>管理员列表</title>
</head>
<%@include file="../../common/common.jsp"%>
<body>
<div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="#"><cite>管理员列表</cite></a>
          </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body layui-table-body layui-table-main">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>用户名</th>
                            <th>密码</th>
                            <th>性别</th>
                            <th>身份证号</th>
                            <th>用户类型</th>
                            <th>操作</th></tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${adminList}" var="admin">
                            <tr>
                                <td>${admin.id}</td>
                                <td>${admin.loginName}</td>
                                <td>${admin.password}</td>
                                <td>${admin.sex == 0? '男':'女'}</td>
                                <td>${admin.idCard}</td>
                                <td>
                                    <c:if test="${admin.type == 0}">
                                        管理员
                                    </c:if>
                                    <c:if test="${admin.type != 0}">
                                        ${admin.type == 1? '员工':'租客'}
                                    </c:if>
                                </td>
                                <td class="td-manage">
                                    <a title="编辑"  onclick="xadmin.open('编辑','../admin/toUpdateAdmin?id='+${admin.id},600,520)" href="javascript:;">
                                        <button class="layui-btn layui-btn-normal">编辑</button>
                                    </a>
                                    <a title="删除" href="#">
                                        <button class="layui-btn layui-btn-warm" <c:if test="${admin.type == 0}">disabled</c:if>>删除</button>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    //分页跳转
    function jump(pageCount) {
        var loginName = $("#loginName").val();
        var idCard = $("#idCard").val();
        location.href = contextPath +"/admin/getAdminList?currentPage="+pageCount+"&loginName="+loginName+"&idCard="+idCard;
    }

    layui.use('form', function(){
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
    });
</script>
</html>
