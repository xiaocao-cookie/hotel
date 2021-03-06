<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>前台首页</title>
</head>
<%@include file="WEB-INF/common/common.jsp"%>
<body>
<%@include file="WEB-INF/common/header.jsp"%>
<%--  右侧  --%>
<div id="clock" style="height: 200px;width: 200px;position: absolute;right: 30px;top: 40px"></div>
<div class="site-demo-laydate" style="position: absolute;right: 0;top: 300px">
    <div class="layui-inline" id="date"></div>
</div>
<br><br><br>
<%--  左侧  --%>
<fieldset class="layui-elem-field site-demo-button" style="width: 1050px;height: 500px;margin-left: 20px;border: darkgrey 2px solid">
    <br><br>
    <legend style="font-size: 35px;">让智慧接待开启您的智慧之旅</legend>
    <div style="margin-left: 50px">
        <div class="layui-col-md8">
            <div class="layui-carousel" id="carousel">
                <div carousel-item>
                    <div><img src="${ctx}/statics/images/carousel1.jpg" style="width: 600px;height: 400px;"></div>
                    <div><img src="${ctx}/statics/images/carousel2.jpg" style="width: 600px;height: 400px;"></div>
                    <div><img src="${ctx}/statics/images/carousel3.jpg" style="width: 600px;height: 400px;"></div>
                    <div><img src="${ctx}/statics/images/carousel4.jpg" style="width: 600px;height: 400px;"></div>
                    <div><img src="${ctx}/statics/images/carousel5.jpg" style="width: 600px;height: 400px;"></div>
                </div>
            </div>
        </div>
        <div class="layui-col-md4">
            <div class="layui-card" style="width: 290px">
                <div class="layui-card-header"
                     style="background:linear-gradient(45deg, #1de099, #1dc8cd);color: white;font-size: medium">
                    今日公告
                </div>
                <div class="layui-card-body">
                    &nbsp;&nbsp;&nbsp;&nbsp;旅行是遇见不同的风光、人群、事物，<br/>
                    也是在不同经历的碰撞和交织中让人们的生活和生命更加丰富
                </div>
            </div>
            <br><br>
            <a href="#"><button type="button" class="layui-btn layui-btn-radius" onclick="verifyUser('${sessionScope.loginUser.id}',1)" style="width: 136px;height: 50px;font-size: medium">我要入住</button></a>
            <a href="#"><button type="button" class="layui-btn layui-btn-radius" onclick="verifyUser('${sessionScope.loginUser.id}',2)" style="width: 136px;height: 50px;font-size: medium">我的订单</button></a>
            <br><br><br>
            <a href="#"><button type="button" class="layui-btn layui-btn-radius" onclick="verifyUserAndRoom('${sessionScope.loginUser.id}',1)" style="width: 136px;height: 50px;font-size: medium">退租</button></a>
            <a href="#"><button type="button" class="layui-btn layui-btn-radius" onclick="verifyUserAndRoom('${sessionScope.loginUser.id}',2)" style="width: 136px;height: 50px;font-size: medium">续租</button></a>
            <br><br><br>
            <a href="#"><button type="button" class="layui-btn layui-btn-radius" onclick="verifyUser('${sessionScope.loginUser.id}',3)" style="width: 136px;height: 50px;font-size: medium">点餐</button></a>
            <a href="${ctx}/Home/toGetHotelInfo"><button type="button" class="layui-btn layui-btn-radius" style="width: 136px;height: 50px;font-size: medium">酒店信息</button></a>
        </div>
    </div>
</fieldset>

<script type="text/javascript">
    //日历显示
    layui.use('laydate',function () {
        var laydate = layui.laydate;
        laydate.render({
            elem: '#date'
            ,position: 'static'
        });
    });

    var layer = layui.layer;
    function verifyUser(id,menu){
        if (id == null || id == ""){
            layer.confirm('需要先登录哦',{
                btn: ['去登录'] //可以无限个按钮
            },function(){
                window.location.href = contextPath + "/Login/toLogin";
            });
            return;
        }
        //点击我要入住
        if (menu == 1){
            window.location.href = contextPath + "/Home/goRoomList";
            return;
        }
        //点击我的订单
        if (menu == 2){
            window.location.href = contextPath + "/order/queryMyOrder?userId="+id;
            return;
        }
        //点击点餐
        if (menu == 3){
            window.location.href = contextPath + "/food/getFoodList";
            return;
        }
    }

    function verifyUserAndRoom(id,menu){
        if (id == null || id == ""){
            layer.confirm('需要先登录哦',{
                btn: ['去登录'] //可以无限个按钮
            },function(){
                window.location.href = contextPath + "/Login/toLogin";
            });
            return;
        }

        $.ajax({
            url: contextPath + "/order/verifyRoomOrder",
            method: 'post',
            data: {
                id: id
            },
            success(jsonStr){
                var result = eval("("+jsonStr+")");
                if (result.status == 1) {
                    layer.alert(result.message, {icon: 6});
                } else {
                    location.href = contextPath + "/order/queryRoomOrder?id="+id+"&menu="+menu;
                }
            }
        })
    }

    //轮播图实现
    layui.use('carousel', function(){
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#carousel'
            ,width: '600px' //设置容器宽度
            ,height: '400px'
            ,arrow: 'hover' //始终显示箭头
            ,anim: 'fade' //切换动画方式
        });
    });

    //钟表的动态显示
    var chartDom = document.getElementById('clock');
    var myChart = echarts.init(chartDom);
    var option;

    option = {
        series: [{
            name: 'hour',
            type: 'gauge',
            radius: '100',
            startAngle: 90,
            endAngle: -270,
            min: 0,
            max: 12,
            splitNumber: 12,
            axisLine: {
                lineStyle: {
                    width: 0,
                    color: [
                        [1, 'rgba(0,0,0,0.7)']
                    ],
                    shadowColor: 'rgba(0, 0, 0, 0.5)',
                    shadowBlur: 1
                }
            },
            splitLine: {
                lineStyle: {
                    shadowColor: 'rgba(0, 0, 0, 0.3)',
                    shadowBlur: 3,
                    shadowOffsetX: 1,
                    shadowOffsetY: 2
                }
            },
            axisLabel: {
                fontSize: 10,
                distance: 10,
                formatter: function (value) {
                    if (value === 0) {
                        return '';
                    }
                    return value;
                }
            },
            anchor: {
                show: true,
                icon: 'path://M532.8,70.8C532.8,70.8,532.8,70.8,532.8,70.8L532.8,70.8C532.7,70.8,532.8,70.8,532.8,70.8z M456.1,49.6c-2.2-6.2-8.1-10.6-15-10.6h-37.5v10.6h37.5l0,0c2.9,0,5.3,2.4,5.3,5.3c0,2.9-2.4,5.3-5.3,5.3v0h-22.5c-1.5,0.1-3,0.4-4.3,0.9c-4.5,1.6-8.1,5.2-9.7,9.8c-0.6,1.7-0.9,3.4-0.9,5.3v16h10.6v-16l0,0l0,0c0-2.7,2.1-5,4.7-5.3h10.3l10.4,21.2h11.8l-10.4-21.2h0c6.9,0,12.8-4.4,15-10.6c0.6-1.7,0.9-3.5,0.9-5.3C457,53,456.7,51.2,456.1,49.6z M388.9,92.1h11.3L381,39h-3.6h-11.3L346.8,92v0h11.3l3.9-10.7h7.3h7.7l3.9-10.6h-7.7h-7.3l7.7-21.2v0L388.9,92.1z M301,38.9h-10.6v53.1H301V70.8h28.4l3.7-10.6H301V38.9zM333.2,38.9v10.6v10.7v31.9h10.6V38.9H333.2z M249.5,81.4L249.5,81.4L249.5,81.4c-2.9,0-5.3-2.4-5.3-5.3h0V54.9h0l0,0c0-2.9,2.4-5.3,5.3-5.3l0,0l0,0h33.6l3.9-10.6h-37.5c-1.9,0-3.6,0.3-5.3,0.9c-4.5,1.6-8.1,5.2-9.7,9.7c-0.6,1.7-0.9,3.5-0.9,5.3l0,0v21.3c0,1.9,0.3,3.6,0.9,5.3c1.6,4.5,5.2,8.1,9.7,9.7c1.7,0.6,3.5,0.9,5.3,0.9h33.6l3.9-10.6H249.5z M176.8,38.9v10.6h49.6l3.9-10.6H176.8z M192.7,81.4L192.7,81.4L192.7,81.4c-2.9,0-5.3-2.4-5.3-5.3l0,0v-5.3h38.9l3.9-10.6h-53.4v10.6v5.3l0,0c0,1.9,0.3,3.6,0.9,5.3c1.6,4.5,5.2,8.1,9.7,9.7c1.7,0.6,3.4,0.9,5.3,0.9h23.4h10.2l3.9-10.6l0,0H192.7z M460.1,38.9v10.6h21.4v42.5h10.6V49.6h17.5l3.8-10.6H460.1z M541.6,68.2c-0.2,0.1-0.4,0.3-0.7,0.4C541.1,68.4,541.4,68.3,541.6,68.2L541.6,68.2z M554.3,60.2h-21.6v0l0,0c-2.9,0-5.3-2.4-5.3-5.3c0-2.9,2.4-5.3,5.3-5.3l0,0l0,0h33.6l3.8-10.6h-37.5l0,0c-6.9,0-12.8,4.4-15,10.6c-0.6,1.7-0.9,3.5-0.9,5.3c0,1.9,0.3,3.7,0.9,5.3c2.2,6.2,8.1,10.6,15,10.6h21.6l0,0c2.9,0,5.3,2.4,5.3,5.3c0,2.9-2.4,5.3-5.3,5.3l0,0h-37.5v10.6h37.5c6.9,0,12.8-4.4,15-10.6c0.6-1.7,0.9-3.5,0.9-5.3c0-1.9-0.3-3.7-0.9-5.3C567.2,64.6,561.3,60.2,554.3,60.2z',
                showAbove: false,
                offsetCenter: [0, '-35%'],
                size: 1,
                keepAspect: true,
                itemStyle: {
                    color: '#707177'
                }
            },
            pointer: {
                icon: 'path://M2.9,0.7L2.9,0.7c1.4,0,2.6,1.2,2.6,2.6v115c0,1.4-1.2,2.6-2.6,2.6l0,0c-1.4,0-2.6-1.2-2.6-2.6V3.3C0.3,1.9,1.4,0.7,2.9,0.7z',
                width: 7,
                length: '55%',
                offsetCenter: [0, '8%'],
                itemStyle: {
                    color: '#C0911F',
                    shadowColor: 'rgba(0, 0, 0, 0.3)',
                    shadowBlur: 8,
                    shadowOffsetX: 2,
                    shadowOffsetY: 4
                }
            },
            detail: {
                show: false
            },
            title: {
                offsetCenter: [0, '30%']
            },
            data: [{
                value: 0
            }]
        },
            {
                name: 'minute',
                type: 'gauge',
                startAngle: 90,
                endAngle: -270,
                min: 0,
                max: 60,
                axisLine: {
                    show: false
                },
                splitLine: {
                    show: false
                },
                axisTick: {
                    show: false
                },
                axisLabel: {
                    show: false
                },
                pointer: {
                    icon: 'path://M2.9,0.7L2.9,0.7c1.4,0,2.6,1.2,2.6,2.6v115c0,1.4-1.2,2.6-2.6,2.6l0,0c-1.4,0-2.6-1.2-2.6-2.6V3.3C0.3,1.9,1.4,0.7,2.9,0.7z',
                    width: 4,
                    length: '99%',
                    offsetCenter: [0, '8%'],
                    itemStyle: {
                        color: '#C0911F',
                        shadowColor: 'rgba(0, 0, 0, 0.3)',
                        shadowBlur: 8,
                        shadowOffsetX: 2,
                        shadowOffsetY: 4
                    }
                },
                anchor: {
                    show: true,
                    size: 20,
                    showAbove: false,
                    itemStyle: {
                        borderWidth: 15,
                        borderColor: '#C0911F',
                        shadowColor: 'rgba(0, 0, 0, 0.3)',
                        shadowBlur: 8,
                        shadowOffsetX: 2,
                        shadowOffsetY: 4
                    }
                },
                detail: {
                    show: false
                },
                title: {
                    offsetCenter: ['0%', '-40%']
                },
                data: [{
                    value: 0
                }]
            },
            {
                name: 'second',
                type: 'gauge',
                startAngle: 90,
                endAngle: -270,
                min: 0,
                max: 60,
                animationEasingUpdate: 'bounceOut',
                axisLine: {
                    show: false
                },
                splitLine: {
                    show: false
                },
                axisTick: {
                    show: false
                },
                axisLabel: {
                    show: false
                },
                pointer: {
                    icon: 'path://M2.9,0.7L2.9,0.7c1.4,0,2.6,1.2,2.6,2.6v115c0,1.4-1.2,2.6-2.6,2.6l0,0c-1.4,0-2.6-1.2-2.6-2.6V3.3C0.3,1.9,1.4,0.7,2.9,0.7z',
                    width: 2,
                    length: '120%',
                    offsetCenter: [0, '8%'],
                    itemStyle: {
                        color: '#C0911F',
                        shadowColor: 'rgba(0, 0, 0, 0.3)',
                        shadowBlur: 8,
                        shadowOffsetX: 2,
                        shadowOffsetY: 4
                    }
                },
                anchor: {
                    show: true,
                    size: 15,
                    showAbove: true,
                    itemStyle: {
                        color: '#C0911F',
                        shadowColor: 'rgba(0, 0, 0, 0.3)',
                        shadowBlur: 8,
                        shadowOffsetX: 2,
                        shadowOffsetY: 4
                    }
                },
                detail: {
                    show: false
                },
                title: {
                    offsetCenter: ['0%', '-40%']
                },
                data: [{
                    value: 0
                }]
            }]
    };

    var timeUpdatedStatus = {
        second: false,
        minute: false,
        hour: false
    };

    function updateSeries(time, series, type) {
        var isCritical = (Math.floor(time) === 0) || (type === 'second' && time === 1);
        if (isCritical && timeUpdatedStatus[type] === true) {
            timeUpdatedStatus[type] = false;
            series.data[0].value = 0;
            series.clockwise = true;
            option.animationDurationUpdate = 0;
            myChart.setOption(option, true);
        }
        series.data[0].value = time;
        series.clockwise = true;
        if (time === 0) {
            timeUpdatedStatus[type] = true;
            series.clockwise = false;
        }
    }

    setInterval(function () {
        var date = new Date();
        var second = date.getSeconds();
        var minute = date.getMinutes() + second / 60;
        var hour = date.getHours() % 12 + minute / 60;

        updateSeries(second, option.series[2], 'second');
        updateSeries(minute, option.series[1], 'minute');
        updateSeries(hour, option.series[0], 'hour');

        option.animationDurationUpdate = 300;
        myChart.setOption(option, true);
        date = null;
    }, 1000);
    option && myChart.setOption(option);
</script>
</body>
</html>
