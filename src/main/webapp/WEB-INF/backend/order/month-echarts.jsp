<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>月销售额</title>
</head>
<%@include file="../../common/common.jsp"%>
<body>
<br>
<div id="month" style="width: 1300px;height: 500px;position: relative;left: -50px"></div>
</body>
<script>
    var chartDom = document.getElementById('month');
    var myChart = echarts.init(chartDom);
    var option;

    option = {
        title: {
            text: '四月营业额',
            left: "center"
        },
        xAxis: {
            type: 'category',
            data: ['1日', '2日', '3日', '4日', '5日', '6日', '7日','8日','9日',
                '10日', '11日','12日', '13日', '14日', '15日', '16日', '17日','18日','19日','20日',
                '21日', '22日', '23日', '24日', '25日', '26日', '27日','28日','29日','30日'
            ]
        },
        yAxis: {
            type: 'value'
        },
        series: [{
            data: [4500, 3500, 3000, 4000, 3700, 4110, 3130, 4100,2120,3250,4320,
                3280, 4200, 2150, 1580, 4570, 3110, 4130, 5100,4120,3250,6320,
                4120, 5200, 4150, 3280, 2570, 4110, 3130, 4100,4140
            ],
            type: 'bar',
            showBackground: true,
            backgroundStyle: {
                color: 'rgba(180, 180, 180, 0.2)'
            }
        }]
    };

    option && myChart.setOption(option);

</script>
</html>
