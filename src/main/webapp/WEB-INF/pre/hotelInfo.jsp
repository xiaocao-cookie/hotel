<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>酒店信息</title>
</head>
<%@include file="../common/common.jsp"%>
<body>
<%@include file="../common/header.jsp"%>
<div class="layui-col-md6">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
        <legend style="font-size: x-large">发展历程</legend>
    </fieldset>
    <ul class="layui-timeline" id="timelineUl">
        <li class="layui-timeline-item">
            <i class="layui-icon layui-timeline-axis"></i>
            <div class="layui-timeline-content layui-text">
                <h3 class="layui-timeline-title">2017年————蛰伏</h3>
                <p>
                    豫来豫好酒店板块业务正式开展，标志着集团正式涉足酒店行业，<br/>
                    先后与某豪、某悦、洲际、某尔顿等国际知名酒店管理公司缔结战略合作关系。<br>
                    与国际知名的某悦酒店集团（Mous Hotels Corporation）缔结合作，上海外滩某大酒店盛大开业，坐拥浦江两岸景观的特色及豪华高雅的环境，成为宾客的理想之选。</p>
            </div>
        </li>
        <li class="layui-timeline-item">
            <i class="layui-icon layui-timeline-axis"></i>
            <div class="layui-timeline-content layui-text">
                <h3 class="layui-timeline-title">2019年————奋发</h3>
                <p>世茂酒店及度假村先后与某际酒店集团（Mous Hotels Group）、某尔顿酒店集团（Mous Hotels Corporation）缔结合作。<br/>
                   分别在牡丹江、绍兴、南京、芜湖、福州、上海、北京、天津等地区打造当地地标酒店。</p>
            </div>
        </li>
        <li class="layui-timeline-item">
            <i class="layui-icon layui-timeline-axis"></i>
            <div class="layui-timeline-content layui-text">
                <h3 class="layui-timeline-title">2021年————瞩目</h3>
                <p>
                    豫来豫好酒店及度假村自2017年起，连续多年荣膺众多旅游/酒店业界知名奖项<br>
                    更是进入2021年度中国饭店集团50强，标志着豫来豫好酒店及度假村进入中国酒店最强梯队。
                </p>
            </div>
        </li>
    </ul>
    <button class="layui-btn layui-btn-normal" type="button" style="position:relative;bottom: -50px" onclick="window.history.go(-1)">
        <i class="layui-icon layui-icon-prev"></i>返回上一页</button>
</div>
<div class="layui-col-md6">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
            <legend style="font-size: x-large">酒店信息</legend>
        </fieldset>
        <table class="layui-table" lay-size="lg">
            <tbody>
            <tr>
                <th>酒店名称</th>
                <td><i class="layui-icon layui-icon-praise" style="color: #FF5722;font-size: 20px;position: relative;top: 3px;"></i>&nbsp;豫来豫好大酒店</td></tr>
            <tr>
                <th>酒店介绍</th>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    豫来豫好酒店专业从事全服务酒店及有限服务酒店的投资营运和管理，以及餐饮业的投资与经营。通过产业资本双轮驱动，推进酒店业的“全球布局，跨国经营”战略。 目前，本集团在全球范围内拥有或管理的已签约酒店共10290家，客房总数约100万间，分布于全球68个国家。其中，中国境内拥有或管理的已开业的酒店共5,495家，客房总数约57万间。</td></tr>
            <tr>
                <th>品牌理念</th>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    始终秉承河工集团缔造生活品位，成就城市梦想的宗旨，豫来豫好酒店以打造优质品牌，为客户开启智慧之旅为使命。
                    以卓越的酒店资产管理能力为核心竞争力，致力于实现用匠心缔造世茂风格化的旅行体验及生活方式。
                </td>
            </tr>
            <tr>
                <th>客服</th>
                <td><i class="layui-icon layui-icon-service" style="font-size: 20px;color: #93D1FF"></i>&nbsp;400-0000-0000</td>
            </tr>
            <tr>
                <th>地址</th>
                <td><i class="layui-icon layui-icon-location" style="color: #1E9FFF;font-size: 20px"></i>&nbsp;河南省郑州市新郑市龙湖镇</td></tr>
            <tr>
                <th>邮箱</th>
                <td><i class="layui-icon layui-icon-email" style="color: #1de099;font-size: 21px;position: relative;top: 3px;"></i>&nbsp;2323@smarthotel.com</td></tr>
            <tr>
                <th>营业时间</th>
                <td><i class="layui-icon layui-icon-time" style="color: #1E9FFF;font-size: 20px;position: relative;top: 3px;"></i>&nbsp;00:00 - 24:00  周一至周日</td></tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
