<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>周销售额</title>
</head>
<%@include file="../../common/common.jsp"%>
<body>
<br>
<div id="week" style="width: 1000px;height: 500px;margin-left: 100px"></div>
</body>
<script>
    var chartDom = document.getElementById('week');
    var myChart = echarts.init(chartDom);
    var option;

    option = {
        title: {
            text: '周营业额'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data: ['房间营业额', '菜品营业额', '入住人数']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        toolbox: {
            feature: {
                saveAsImage: {}
            }
        },
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
        },
        yAxis: {
            type: 'value'
        },
        series: [
            {
                name: '房间营业额',
                type: 'line',
                stack: '总量',
                data: [120, 132, 101, 134, 90, 230, 210]
            },
            {
                name: '菜品营业额',
                type: 'line',
                stack: '总量',
                data: [220, 182, 191, 234, 290, 330, 310]
            },
            {
                name: '入住人数',
                type: 'line',
                stack: '总量',
                data: [150, 232, 201, 154, 190, 330, 410]
            }
        ]
    };

    option && myChart.setOption(option);

</script>
</html>
