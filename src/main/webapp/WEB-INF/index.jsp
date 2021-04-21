<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm" lang="en">
    <head>
        <meta charset="UTF-8">
        <title>智慧酒店</title>
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <meta http-equiv="Cache-Control" content="no-siteapp" />
    </head>
    <%@include file="common/common.jsp"%>
    <body class="index">
        <!-- 顶部开始 -->
        <div class="container">
                <%-- 左侧  --%>
            <div class="logo">
                <a href="${ctx}/Home/toFrontHome">Smart Hotel</a></div>
            <div class="left_open">
                <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
            </div>
                <%-- 右侧  --%>
            <ul class="layui-nav right" lay-filter="">
                <li class="layui-nav-item">
                    <a href="javascript:;">${sessionScope.loginUser.loginName}</a>
                    <dl class="layui-nav-child">
                        <!-- 二级菜单 -->
                        <dd>
                            <a onclick="xadmin.open('个人信息','../user/toPersonalInfo')">个人信息</a></dd>
                        <dd>
                            <a onclick="xadmin.open('修改密码','../user/toChangePassword')">修改密码</a></dd>
                        <dd>
                            <a href="${ctx}/Login/toLogin">切换帐号</a></dd>
                        <dd>
                            <a href="${ctx}/Login/loginOut">退出</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item to-index">
                    <a href="${ctx}/Home/toFrontHome">前台首页</a></li>
            </ul>
        </div>
        <!-- 顶部结束 -->
        <!-- 中部开始 -->
        <!-- 左侧菜单开始 -->
        <div class="left-nav">
            <div id="side-nav">
                <ul id="nav">
                    <%-- 用户管理 --%>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="会员管理">&#xe6b8;</i>
                            <cite>会员管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('统计页面','../chart/member')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>统计页面</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('会员列表(静态表格)','../user/queryPageUsers')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>会员列表(静态表格)</cite></a>
                            </li>
                        </ul>
                    </li>
                    <%-- 订单管理  --%>
                    <li>
                        <a href="javascript:;">
                            <i class="layui-icon layui-icon-cart" lay-tips="订单管理"></i>
                            <cite>订单管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('订单列表','order-list.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>订单列表</cite></a>
                            </li>
                            <li>
                                <a href="javascript:;">
                                    <i class="iconfont">&#xe6a2;</i>
                                    <cite>统计页面</cite>
                                    <i class="iconfont nav_right">&#xe697;</i></a>
                                <ul class="sub-menu">
                                    <li>
                                        <a onclick="xadmin.add_tab('日订单统计','member-del.html')">
                                            <i class="iconfont">&#xe6a7;</i>
                                            <cite>日订单统计</cite></a>
                                    </li>
                                    <li>
                                        <a onclick="xadmin.add_tab('周订单统计','member-list1.html')">
                                            <i class="iconfont">&#xe6a7;</i>
                                            <cite>周订单统计</cite></a>
                                    </li>
                                    <li>
                                        <a onclick="xadmin.add_tab('月订单统计','member-list1.html')">
                                            <i class="iconfont">&#xe6a7;</i>
                                            <cite>月订单统计</cite></a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <%-- 房间管理  --%>
                    <li>
                        <a href="javascript:;">
                            <i class="layui-icon layui-icon-home" lay-tips="房间管理"></i>
                            <cite>房间管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i>
                        </a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('房间列表','../Room/queryPageRooms')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>房间列表</cite></a>
                            </li>
                        </ul>
                    </li>
                    <%-- 菜品管理  --%>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="菜品管理">&#xe696;</i>
                            <cite>菜品管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i>
                        </a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('菜品列表','../food/queryPageFoods')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>菜品列表</cite></a>
                            </li>
                        </ul>
                    </li>
                    <%--  通知管理 --%>
                    <li>
                        <a href="javascript:;">
                            <i class="layui-icon layui-icon-notice" lay-tips="通知管理"></i>
                            <cite>通知管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i>
                        </a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('通知列表','../notice/queryPageNotices')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>通知列表</cite></a>
                            </li>
                        </ul>
                    </li>
                    <%-- 管理员管理  --%>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="管理员管理">&#xe726;</i>
                            <cite>管理员管理</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('管理员列表','../admin/getAdminList')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>管理员列表</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('角色管理','../admin/getAdminRole')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>角色管理</cite></a>
                            </li>
                        </ul>
                    </li>
                    <%--  系统统计  --%>
                    <li>
                        <a href="javascript:;">
                            <i class="iconfont left-nav-li" lay-tips="系统统计">&#xe6ce;</i>
                            <cite>系统统计</cite>
                            <i class="iconfont nav_right">&#xe697;</i></a>
                        <ul class="sub-menu">
                            <li>
                                <a onclick="xadmin.add_tab('拆线图','echarts1.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>拆线图</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('拆线图','echarts2.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>拆线图</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('地图','echarts3.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>地图</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('饼图','echarts4.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>饼图</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('雷达图','echarts5.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>雷达图</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('k线图','echarts6.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>k线图</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('热力图','echarts7.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>热力图</cite></a>
                            </li>
                            <li>
                                <a onclick="xadmin.add_tab('仪表图','echarts8.html')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>仪表图</cite></a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <!-- <div class="x-slide_left"></div> -->
        <!-- 左侧菜单结束 -->
        <!-- 右侧主体开始 -->
        <div class="page-content">
            <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
                <ul class="layui-tab-title">
                    <li class="home">
                        <i class="layui-icon">&#xe68e;</i>我的桌面</li></ul>
                <div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
                    <dl>
                        <dd data-type="this">关闭当前</dd>
                        <dd data-type="other">关闭其它</dd>
                        <dd data-type="all">关闭全部</dd></dl>
                </div>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <iframe src='${ctx}/Home/toWelcome' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
                    </div>
                </div>
                <div id="tab_show"></div>
            </div>
        </div>
        <div class="page-content-bg"></div>
        <style id="theme_style"></style>
        <!-- 右侧主体结束 -->
        <!-- 中部结束 -->
        </body>
</html>