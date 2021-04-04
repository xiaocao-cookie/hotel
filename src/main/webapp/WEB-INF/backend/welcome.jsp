<%@ page import="java.nio.file.Path" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>我的桌面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
</head>
<%@include file="../common/common.jsp"%>
<body>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <%--  显示管理员的登录名和当前时间  --%>
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <blockquote class="layui-elem-quote">欢迎管理员：
                        <span class="x-red" style="font-size: large">${sessionScope.loginUser.loginName}！</span>
                        <%
                            Date now = new Date();
                            request.setAttribute("now",now);
                        %>
                        当前时间:<fmt:formatDate value="${requestScope.now}" pattern="yyyy-MM-dd HH:mm:ss"/>
                    </blockquote>
                </div>
            </div>
        </div>
        <%--  网站相关统计  --%>
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">数据统计</div>
                <div class="layui-card-body ">
                    <ul class="layui-row layui-col-space10 layui-this x-admin-carousel x-admin-backlog">
                        <li class="layui-col-md2 layui-col-xs6">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>IP日均访问量
                                    <span class="layui-badge layui-bg-cyan layuiadmin-badge">日</span>
                                </h3>
                                <p>
                                    <cite>16,600+</cite></p>
                            </a>
                        </li>
                        <li class="layui-col-md2 layui-col-xs6">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>IP月均访问量
                                    <span class="layui-badge layui-bg-orange layuiadmin-badge">月</span>
                                </h3>
                                <p>
                                    <cite>100,000+</cite></p>
                            </a>
                        </li>
                        <li class="layui-col-md2 layui-col-xs6">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>累计好评
                                    <span class="layui-icon layui-icon-praise" style="color: #FF4700;font-size: 20px;position:relative;top: 3px"></span>
                                </h3>
                                <p>
                                    <cite>100W+</cite></p>
                            </a>
                        </li>
                        <li class="layui-col-md2 layui-col-xs6">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>累计人次
                                    <span class="layui-icon layui-icon-user" style="color: #393D49"></span>
                                </h3>
                                <p>
                                    <cite>90,000+</cite></p>
                            </a>
                        </li>
                        <li class="layui-col-md2 layui-col-xs6">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>日销售额
                                    <span class="layui-badge layui-bg-cyan layuiadmin-badge">日</span>
                                </h3>
                                <p>
                                    <cite>7,000+</cite></p>
                            </a>
                        </li>
                        <li class="layui-col-md2 layui-col-xs6 ">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>月销售额
                                    <span class="layui-badge layui-bg-orange layuiadmin-badge">月</span>
                                </h3>
                                <p>
                                    <cite>150,000+</cite></p>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <%--  系统信息  --%>
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">系统信息</div>
                <div class="layui-card-body ">
                    <table class="layui-table">
                        <tbody>
                        <tr>
                            <th>版本</th>
                            <td>1.0.210125</td></tr>
                        <tr>
                            <th>服务器地址</th>
                            <td>www.wenhao.com</td></tr>
                        <tr>
                            <th>操作系统</th>
                            <td>WINNT</td></tr>
                        <tr>
                            <th>运行环境</th>
                            <td>Apache Tomcat 9.0.36/niginx 1.5.41</td></tr>
                        <tr>
                            <th>java版本</th>
                            <td>11</td></tr>
                        <tr>
                            <th>MYSQL版本</th>
                            <td>5.5.53</td></tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <style id="welcome_style"></style>
    </div>
</div>
</div>
</body>
</html>
