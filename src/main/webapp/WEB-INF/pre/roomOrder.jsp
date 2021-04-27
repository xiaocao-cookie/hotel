<%@ page import="java.nio.file.Path" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>房间预订</title>
</head>
<%@include file="../common/common.jsp"%>
<body>
<div class="layui-col-md10 layui-col-md-offset1">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
        <legend>订单信息</legend>
    </fieldset>

    <table class="layui-table" lay-size="lg">
        <colgroup>
            <col width="200">
            <col width="50">
        </colgroup>
        <tbody>
        <tr>
            <td>房间号</td>
            <td id="rno">${room.rno}</td>
        </tr>
        <tr>
            <td>房间名</td>
            <td id="rname">${room.rname}</td>
        </tr>
        <tr>
            <td>选择租赁日期</td>
            <td>
                <%
                    Date now = new Date();
                %>
                <div class="layui-inline">
                    <div class="layui-input-inline">
                        <input type="text" class="layui-input" id="startTime" placeholder="yyyy-MM-dd"
                        value="<fmt:formatDate value="<%=now %>" pattern="yyyy-MM-dd" />" >
                    </div>
                    --
                    <div class="layui-input-inline">
                        <input type="text" class="layui-input" id="endTime" placeholder="yyyy-MM-dd">
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>房间类型</td>
            <td id="rtype">
                <c:if test="${room.rtype == 0}">单人间</c:if>
                <c:if test="${room.rtype == 1}">大床房</c:if>
                <c:if test="${room.rtype == 2}">双人间</c:if>
                <c:if test="${room.rtype == 3}">三人间</c:if>
                <c:if test="${room.rtype == 4}">套房</c:if>
            </td>
        </tr>
        <tr>
            <td>装修风格</td>
            <td id="style">${room.rstyle}</td>
        </tr>
        <tr>
            <td>所在楼层</td>
            <td id="floor">
                <c:if test="${room.rfloor == 1}">一层</c:if>
                <c:if test="${room.rfloor == 2}">二层</c:if>
                <c:if test="${room.rfloor == 3}">三层</c:if>
            </td>
        </tr>
        <tr>
            <td>价格(单位：元)</td>
            <td id="price" hidden>${price}</td>
            <td id="count" hidden></td>
            <td id="realPrice">${price}</td>
        </tr>
        </tbody>
    </table>
    <br/>
    <button type="button" class="layui-btn layui-btn-lg layui-btn-danger" style="margin-left: 350px" id="orderRoom"
            onclick="orderRoom(${sessionScope.loginUser.id});">确定并支付</button>
    <button type="button" class="layui-btn layui-btn-lg layui-btn-normal" style="margin-left: 30px" id="cancel"
            onclick="xadmin.close()">取消订单</button>
    <br/><br><br>
</div>
</body>
<script>
    layui.use(['form', 'laydate'], function() {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;

        laydate.render({
            elem: '#startTime'
            , format: 'yyyy-MM-dd',
            done: function(value){
                var startDate = value.substr(8);
                var endTime = $("#endTime").val();
                var endDate = endTime.substr(8);
                var startMonth = value.substr(5,2);
                var endMonth = endTime.substr(5,2);
                if(startMonth == endMonth){
                    if (startDate > endDate){
                        layer.msg('日期范围错误', {
                            icon: 2,
                            time: 1500
                        }, function(){
                            //do something
                        });
                    }else{
                        $("#realPrice").html(${price}+" x "+(endDate - startDate)+" = "+(endDate - startDate)*${price});
                        $("#count").html(endDate - startDate);
                    }
                }else if(startMonth > endMonth){
                    layer.msg('日期范围错误', {
                        icon: 2,
                        time: 1500
                    }, function(){
                        //do something
                    });
                }else{
                    //先算出开始日期到本月月底的时间
                    var time1 = 30 - startDate;
                    //再算出从1号到截止日期的时间
                    var time2 = endDate - 1;
                    $("#realPrice").html(${price}+" x "+(time1+time2+1)+" = "+(time1+time2+1)*${price});
                    $("#count").html(time1+time2+1);
                }
            }
        });
        laydate.render({
            elem: '#endTime'
            , format: 'yyyy-MM-dd',
            done: function(value){
                var startTime = $("#startTime").val();
                var startDate = startTime.substr(8);
                var endDate = value.substr(8);
                var startMonth = startTime.substr(5,2);
                var endMonth = value.substr(5,2);
                if(startMonth == endMonth){
                    if (startDate > endDate){
                        layer.msg('日期范围错误', {
                            icon: 2,
                            time: 1500
                        }, function(){
                            //do something
                        });
                    }else{
                        $("#realPrice").html(${price}+" x "+(endDate - startDate)+" = "+(endDate - startDate)*${price});
                        $("#count").html(endDate - startDate);
                    }
                }else if(startMonth > endMonth){
                    layer.msg('日期范围错误', {
                        icon: 2,
                        time: 1500
                    }, function(){
                        //do something
                    });
                }else{
                    //先算出开始日期到本月月底的时间
                    var time1 = 30 - startDate;
                    //再算出从1号到截止日期的时间
                    var time2 = endDate - 1;
                    $("#realPrice").html(${price}+" x "+(time1+time2+1)+" = "+(time1+time2+1)*${price});
                    $("#count").html(time1+time2+1);
                }
            }
        });
    });
</script>
</html>
