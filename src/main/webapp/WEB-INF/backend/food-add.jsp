<%@ page import="java.nio.file.Path" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>菜品添加</title>
</head>
<%@include file="../common/common.jsp"%>
<body>
<div class="layui-fluid">
    <div class="layui-row">
        <form class="layui-form">
            <div class="layui-form-item">
                <label for="foodName" class="layui-form-label">
                    <span class="x-red">*</span>菜品名称</label>
                <div class="layui-input-inline">
                    <input type="text" id="foodName" name="foodName" required autocomplete="off" class="layui-input">
                    <i style="position: absolute;top: 8px;left: 165px;font-size: 20px;color: #5FB878;" id="foodNameOk" hidden class="layui-icon layui-icon-ok-circle"></i>
                    <i style="position: absolute;top: 8px;left: 165px;font-size: 20px;color: red" id="foodNameClose" hidden class="layui-icon layui-icon-close-fill"></i>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="price" class="layui-form-label">
                    <span class="x-red">*</span>价格
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="price" name="price" placeholder="￥" required autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">菜品照片</label>
                <div class="layui-upload">
                    <button type="button" class="layui-btn" id="test1">上传图片</button>
                    <div class="layui-upload-list">
                        <img class="layui-upload-img" id="demo1" style="width: 120px;height: 100px;margin-left: 110px">
                        <p id="demoText"></p>
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="stars" class="layui-form-label">
                    <span class="x-red">*</span>菜品星级</label>
                <div class="layui-input-inline">
                    <select name="stars" id="stars">
                        <option value="">-- 请选择 --</option>
                        <option value="1">一星级</option>
                        <option value="2">二星级</option>
                        <option value="3">三星级</option>
                        <option value="4">四星级</option>
                        <option value="5">五星级</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 110px">
                <button type="button" style="width: 86px" class="layui-btn" onclick="addFood();">添加</button>
                <button type="reset" style="width: 86px" class="layui-btn layui-btn-normal">重置</button>
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

    //检查菜名是否重复
    $("input[name='foodName']").blur(function () {
        var foodName = $("input[name='foodName']").val();
        $.ajax({
            url: contextPath + "/food/verifyFoodName",
            method: 'post',
            data:{
                foodName: foodName
            },
            success(jsonStr){
                var result = eval("(" + jsonStr + ")");
                if (result.status == 2){
                    $("#foodNameClose").hide();
                    $("#foodNameOk").show();
                }else{
                    $("#foodNameOk").hide();
                    $("#foodNameClose").show();
                }
            }
        })
    });
</script>
</body>
</html>
