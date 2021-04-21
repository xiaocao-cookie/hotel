<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>修改房间</title>
</head>
<%@include file="../../common/common.jsp"%>
<body>
<div class="layui-fluid">
    <div class="layui-row">
        <form class="layui-form">
            <div class="layui-form-item">
                <label for="roomName" class="layui-form-label">
                    <span class="x-red">*</span>房间名</label>
                <div class="layui-input-inline">
                    <input type="text" id="roomName" value="${roomName}" name="roomName" required autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="roomType" class="layui-form-label">
                    <span class="x-red">*</span>房间类型</label>
                <div class="layui-input-inline">
                    <select name="roomType" id="roomType">
                        <option value="">-- 请选择 --</option>
                        <option value="0" <c:if test="${roomType == 0}">selected</c:if>>单人间</option>
                        <option value="1" <c:if test="${roomType == 1}">selected</c:if>>大床房</option>
                        <option value="2" <c:if test="${roomType == 2}">selected</c:if>>二人间</option>
                        <option value="3" <c:if test="${roomType == 3}">selected</c:if>>三人间</option>
                        <option value="4" <c:if test="${roomType == 4}">selected</c:if>>套房</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="status" class="layui-form-label">
                    <span class="x-red">*</span>房间状态</label>
                <div class="layui-input-inline">
                    <select name="status" id="status">
                        <option value="">-- 请选择 --</option>
                        <option value="未预订"<c:if test="${status == '未预订'}">selected</c:if>>未预订</option>
                        <option value="已预订"<c:if test="${status == '已预订'}">selected</c:if>>已预订</option>
                        <option value="脏房" <c:if test="${status == '脏房'}">selected</c:if>>脏房</option>
                        <option value="已租" <c:if test="${status == '已租'}">selected</c:if>>已租</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="roomStyle" class="layui-form-label">
                    <span class="x-red">*</span>装修风格</label>
                <div class="layui-input-inline">
                    <select name="roomStyle" id="roomStyle">
                        <option value="">-- 请选择 --</option>
                        <option value="现代风格" <c:if test="${roomStyle == '现代风格'}">selected</c:if>>现代风格</option>
                        <option value="欧式风格" <c:if test="${roomStyle == '欧式风格'}">selected</c:if>>欧式风格</option>
                        <option value="工业风格" <c:if test="${roomStyle == '工业风格'}">selected</c:if>>工业风格</option>
                        <option value="中式风格" <c:if test="${roomStyle == '中式风格'}">selected</c:if>>中式风格</option>
                        <option value="北欧风格" <c:if test="${roomStyle == '北欧风格'}">selected</c:if>>北欧风格</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">房间照片</label>
                <div class="layui-upload">
                    <button type="button" class="layui-btn" id="test1">上传图片</button>
                    <div class="layui-upload-list">
                        <img src="${ctx}/statics/images/${images}" class="layui-upload-img" id="demo1" style="width: 120px;height: 100px;margin-left: 110px">
                        <p id="demoText"></p>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="roomFloor" class="layui-form-label">
                    <span class="x-red">*</span>房间楼层</label>
                <div class="layui-input-inline">
                    <select name="roomFloor" id="roomFloor">
                        <option value="">-- 请选择 --</option>
                        <option value="1" <c:if test="${roomFloor == 1}">selected</c:if>>一层</option>
                        <option value="2" <c:if test="${roomFloor == 2}">selected</c:if>>二层</option>
                        <option value="3" <c:if test="${roomFloor == 3}">selected</c:if>>三层</option>
                    </select>
                </div>
            </div>
            <input hidden id="rno" value="${rno}">
            <div class="layui-form-item" style="margin-left: 110px">
                <button type="button" style="width: 86px" class="layui-btn" onclick="updateRoom();">修改信息</button>
            </div>
        </form>
    </div>
</div>
<script>
    //确保表单样式
    layui.use(['form', 'layer','jquery'],
        function() {
            $ = layui.jquery;
            var form = layui.form
        });
    //图片上传
    layui.use('upload', function() {
        var $ = layui.jquery
            , upload = layui.upload;

        //普通图片上传
        var uploadInst = upload.render({
            elem: '#test1'
            ,url: 'https://httpbin.org/post' //改成您自己的上传接口
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            }
            ,done: function(res){
                //如果上传失败
                if(res.code > 0){
                    return layer.msg('上传失败');
                }
                //上传成功
            }
            ,error: function(){
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                });
            }
        });
    });
</script>
</body>
</html>
