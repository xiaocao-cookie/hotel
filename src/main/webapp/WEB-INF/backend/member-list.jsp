<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>成员列表</title>
</head>
<%@include file="../common/common.jsp"%>
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
                    <form class="layui-form layui-col-space5" action="${ctx}/user/queryPageUsers">
                        <input hidden name="currentPageNo" value="${pager.currentPage}">
                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" id="loginName" name="loginName" value="<%=request.getParameter("loginName")== null ? "":request.getParameter("loginName")%>"  placeholder="请输入用户名" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" id="idCard" name="idCard" value="<%=request.getParameter("idCard") == null?"":request.getParameter("idCard")%>"  placeholder="请输入身份证号" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <button type="submit" class="layui-btn"><i class="layui-icon">&#xe615;</i></button>
                        </div>
                    </form>
                </div>
                <div class="layui-card-header">
                    <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
                    <button class="layui-btn" onclick="xadmin.open('添加用户','../user/toAddUser',600,520)"><i class="layui-icon"></i>添加用户</button>
                </div>
                <div class="layui-card-body layui-table-body layui-table-main">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>
                            <th>
                                <input type="checkbox" lay-filter="checkall" name="" lay-skin="primary">
                            </th>
                            <th>ID</th>
                            <th>用户名</th>
                            <th>密码</th>
                            <th>性别</th>
                            <th>身份证号</th>
                            <th>用户类型</th>
                            <th>操作</th></tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${userList}" var="user">
                        <tr>
                            <td>
                                <input type="checkbox" name="id" value="${user.id}"   lay-skin="primary">
                            </td>
                            <td>${user.id}</td>
                            <td>${user.loginName}</td>
                            <td hidden class="realPassword">${user.password}</td>
                            <td class="hidePassword">*******
                                <span class="viewPassword"><img src="${ctx}/statics/images/eyes.png" style="width: 20px;height: 20px;position: relative;top: -3px;left: 3px"></span>
                            </td>
                            <td>${user.sex == 0? '男':'女'}</td>
                            <td>${user.idCard}</td>
                            <td>
                                <c:if test="${user.type == 0}">
                                    管理员
                                </c:if>
                                <c:if test="${user.type != 0}">
                                    ${user.type == 1? '员工':'租客'}
                                </c:if>
                            </td>
                            <td class="td-manage">
                                <a title="编辑"  onclick="xadmin.open('编辑','member-edit.html',600,520)" href="javascript:;">
                                    <button class="layui-btn layui-btn-normal">编辑</button>
                                </a>
                                <a title="删除" onclick="delUser(this,${user.id})" href="javascript:;">
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
    //分页跳转
    function jump(pageCount) {
        var loginName = $("#loginName").val();
        var idCard = $("#idCard").val();
        location.href = contextPath +"/user/queryPageUsers?currentPage="+pageCount+"&loginName="+loginName+"&idCard="+idCard;
    }

    //悬浮在眼睛上的查看具体密码的效果
    $(".viewPassword").hover(function () {
        $(this).parent().hide();
        $(this).parent().siblings().show();
    },function () {
        $(".realPassword").hide();
        $(".hidePassword").show();
    });

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
</html>
