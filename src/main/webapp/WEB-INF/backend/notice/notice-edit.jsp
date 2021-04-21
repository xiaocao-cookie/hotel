<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>修改通知</title>
</head>
<%@include file="../../common/common.jsp"%>
<body>
<div class="layui-fluid">
    <div class="layui-row">
        <form class="layui-form">
            <input hidden value="${nSendUid}" name="sendUid" id="sendUid">
            <div class="layui-form-item">
                <label for="sendName" class="layui-form-label">
                    <span class="x-red">*</span>发送者</label>
                <div class="layui-input-inline">
                    <input type="text" id="sendName" name="sendName" value="${nSendName}" disabled class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">
                    <span class="x-red">*</span>接收者</label>
                <div class="layui-input-inline">
                    <table>
                        <tbody>
                        <tr>
                            <c:forEach items="${userList}" var="user" begin="0" step="1" end="${userList.size()/6}">
                                <td><input type="checkbox" value="${user.id}" name="userName" lay-skin="primary" title="${user.loginName}"
                                    <c:if test="${nReceiveName == user.loginName}">checked</c:if>></td>
                            </c:forEach>
                        </tr>
                        <tr>
                            <c:forEach items="${userList}" var="user" begin="${userList.size()/6+1}" step="1" end="${userList.size()*2/6}">
                                <td><input type="checkbox" value="${user.id}" name="userName" lay-skin="primary" title="${user.loginName}"
                                           <c:if test="${nReceiveName == user.loginName}">checked</c:if>></td>
                            </c:forEach>
                        </tr>
                        <tr>
                            <c:forEach items="${userList}" var="user" begin="${userList.size()*2/6+1}" step="1" end="${userList.size()*3/6}">
                                <td><input type="checkbox" value="${user.id}" name="userName" lay-skin="primary" title="${user.loginName}"
                                           <c:if test="${nReceiveName == user.loginName}">checked</c:if>></td>
                            </c:forEach>
                        </tr>
                        <tr>
                            <c:forEach items="${userList}" var="user" begin="${userList.size()*3/6+1}" step="1" end="${userList.size()*4/6}">
                                <td><input type="checkbox" value="${user.id}" name="userName" lay-skin="primary" title="${user.loginName}"
                                           <c:if test="${nReceiveName == user.loginName}">checked</c:if>></td>
                            </c:forEach>
                        </tr>
                        <tr>
                            <c:forEach items="${userList}" var="user" begin="${userList.size()*4/6+1}" step="1" end="${userList.size()*5/6}">
                                <td><input type="checkbox" value="${user.id}" name="userName" lay-skin="primary" title="${user.loginName}"
                                           <c:if test="${nReceiveName == user.loginName}">checked</c:if>></td>
                            </c:forEach>
                        </tr>
                        <tr>
                            <c:forEach items="${userList}" var="user" begin="${userList.size()*5/6+1}" step="1" end="${userList.size()}">
                                <td><input type="checkbox" value="${user.id}" name="userName" lay-skin="primary" title="${user.loginName}"
                                           <c:if test="${nReceiveName == user.loginName}">checked</c:if>></td>
                            </c:forEach>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="content" class="layui-form-label">
                    <span class="x-red">*</span>发布的内容</label>
                <div class="layui-input-inline">
                    <textarea class="layui-textarea" name="content" id="content" style="width: 500px">${content}</textarea>
                </div>
            </div>
            <input hidden id="noticeId" value="${id}">
            <input hidden id="nReceiveId" value="${nReceiveUid}">
            <div class="layui-form-item" style="margin-left: 110px">
                <button type="button" style="width: 86px" class="layui-btn" onclick="updateNotice();">修改</button>
            </div>
        </form>
    </div>
</div>
<script>
    layui.use(['form', 'layer','jquery'],
        function() {
            $ = layui.jquery;
            var form = layui.form
        })
</script>
</body>
</html>
