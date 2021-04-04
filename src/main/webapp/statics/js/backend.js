//用户管理部分
/*用户-删除*/
function delUser(obj,id){
    layer.confirm('确认要删除吗？',function(index){
        $.ajax({
            url: contextPath + "/user/deleteUserById",
            method: 'post',
            data:{
                id: id
            },
            success: function (jsonStr) {
                var result = eval("("+jsonStr+")");
                if (result.status == 1){
                    //发异步删除数据
                    $(obj).parents("tr").remove();
                    layer.msg(result.message,{icon:1,time:1000});
                }else{
                    layer.msg(result.message,{icon:2,time:1000});
                }
            }
        });
    });
}

//表格上方的批量删除按钮
function delAll () {
    var ids = [];

    // 获取选中的id
    $('tbody input').each(function(index, el) {
        if($(this).prop('checked')){
            ids.push($(this).val())
        }
    });

    layer.confirm('确认要删除吗？'+ids.toString(),function(index){
        $.ajax({
            url: contextPath + "/user/deleteUserById",
            method: 'post',
            data:{
                ids: ids
            },
            success: function (jsonStr) {
                var result = eval("("+jsonStr+")");
                for (var i = 0; i < result.resultList.length; i++) {
                    if (result.resultList[i] == 2){
                        layer.msg('删除失败',{icon:2,time:1000});
                        return;
                    }
                }
                $(".layui-form-checked").not('.header').parents('tr').remove();
                layer.msg('删除成功',{icon:1,time:1000});
            }
        });
    });
}

//用户添加
function addUser(){
    //获取相关字段的值
    var loginName = $("input[name='loginName']").val();
    var password = $("input[name='password']").val();
    var rePassword = $("input[name='rePassword']").val();
    var sex = $("input[name='sex']:checked").val();
    var idCard = $("input[name='idCard']").val();
    var userType = $("input[name='userType']").val();

    if (loginName == null || loginName == ""){
        layer.msg('登录名不能为空', {
            icon: 2,
            time: 1000
        }, function(){
            //do something
        });
        return;
    }
    if (password == null || password == ""){
        layer.msg('密码不能为空', {
            icon: 2,
            time: 1000 //2秒关闭（如果不配置，默认是3秒）
        }, function(){
            //do something
        });
        return;
    }
    if (password != rePassword) {
        layer.open({
            type: 1
            ,content: '<div style="padding: 20px 100px;">两次输入密码不一致</div>'
            ,title: '信息'
            ,yes: function(){
                layer.closeAll();
            }
        });
        return;
    }
    if (idCard == null || idCard == ""){
        layer.msg('身份证号不能为空', {
            icon: 2,
            time: 1000 //2秒关闭（如果不配置，默认是3秒）
        }, function(){
            //do something
        });
        return;
    }

    //验证身份证号
    if(!checkIdCard(idCard)){
        layer.open({
            type: 1
            ,content: '<div style="padding: 20px 100px;">身份证号格式不正确</div>'
            ,title: '信息'
            ,yes: function(){
                layer.closeAll();
            }
        });
        return;
    }

    $.ajax({
        url: contextPath + "/Register/register",
        method: "post",
        data: {
            loginName: loginName,
            password: password,
            sex: sex,
            idCard: idCard,
            userType: userType
        },
        success: function (jsonStr) {
            var result = eval("(" + jsonStr + ")");
            if (result.status == 1) {
                layer.alert("添加成功", {
                    icon: 6
                },function() {
                    //关闭当前frame
                    xadmin.close();
                    xadmin.father_reload();
                });
            } else {
                layer.alert("添加失败", {
                    icon: 5
                },function() {
                    xadmin.father_reload();
                });
            }
        }
    });
}
function checkIdCard(idCard) {
    var filter  = /^\w{18}$/;
    if (filter.test(idCard)){
        return true;
    }
    else {
        return false;
    }
}

//房间管理部分
//删除房间
function delRoom(obj,id) {
    layer.confirm('确认要删除吗？',function(index){
        $.ajax({
            url: contextPath + "/Room/deleteRoomById",
            method: 'post',
            data:{
                id: id
            },
            success: function (jsonStr) {
                var result = eval("("+jsonStr+")");
                if (result.status == 1){
                    //发异步删除数据
                    $(obj).parents("tr").remove();
                    layer.msg(result.message,{icon:1,time:1000});
                }else{
                    layer.msg(result.message,{icon:2,time:1000});
                }
            }
        });
    });
}


//房间添加
function addRoom() {
    var roomName = $("input[name='roomName']").val();
    var roomType = $("#roomType option:selected").val();
    var status = $("#status option:selected").val();
    var roomStyle = $("#roomStyle option:selected").val();
    var roomFloor = $("#roomFloor option:selected").val();

    if (roomName == null || roomName == ''){
        layer.msg('房间名不能为空', {
            icon: 2,
            time: 1000
        }, function(){
            //do something
        });
        return;
    }
    if (roomType == null || roomType == ''){
        layer.msg('房间类型不能为空', {
            icon: 2,
            time: 1000
        }, function(){
            //do something
        });
        return;
    }
    if (status == null || status == ''){
        layer.msg('房间状态不能为空', {
            icon: 2,
            time: 1000
        }, function(){
            //do something
        });
        return;
    }
    if (roomStyle == null || roomStyle == ''){
        layer.msg('装修风格不能为空', {
            icon: 2,
            time: 1000
        }, function(){
            //do something
        });
        return;
    }
    if (roomFloor == null || roomFloor == ''){
        layer.msg('楼层不能为空', {
            icon: 2,
            time: 1000
        }, function(){
            //do something
        });
        return;
    }

    $.ajax({
        url: contextPath + "/Room/addRoom",
        method: 'post',
        data: {
            roomName: roomName,
            roomType: roomType,
            status: status,
            roomStyle: roomStyle,
            roomFloor: roomFloor
        },
        success(jsonStr){
            var result = eval("(" + jsonStr + ")");
            if (result.status == 1) {
                layer.alert(result.message, {
                    icon: 6
                },function() {
                    //关闭当前frame
                    xadmin.close();
                    xadmin.father_reload();
                });
            } else {
                layer.alert(result.message, {
                    icon: 5
                },function() {
                    xadmin.father_reload();
                });
            }

        }
    })
}

//菜品管理部分
//删除菜品
function delFood(obj,id) {
    layer.confirm('确认要删除吗？',function(index){
        $.ajax({
            url: contextPath + "/food/deleteFoodById",
            method: 'post',
            data:{
                id: id
            },
            success: function (jsonStr) {
                var result = eval("("+jsonStr+")");
                if (result.status == 1){
                    //发异步删除数据
                    $(obj).parents("tr").remove();
                    layer.msg(result.message,{icon:1,time:1000});
                }else{
                    layer.msg(result.message,{icon:2,time:1000});
                }
            }
        });
    });
}

//菜品添加
function addFood() {
    var foodName = $("input[name='foodName']").val();
    var price = $("input[name='price']").val();
    var stars = $("#stars option:selected").val();

    if (foodName == null || foodName == ''){
        layer.msg('菜品名称不能为空', {
            icon: 2,
            time: 1000
        }, function(){
            //do something
        });
        return;
    }

    if (price == null || price == ''){
        layer.msg('菜品价格不能为空', {
            icon: 2,
            time: 1000
        }, function(){
            //do something
        });
        return;
    }

    if (stars == null || stars == ""){
        layer.msg('菜品星级不能为空', {
            icon: 2,
            time: 1000
        }, function(){
            //do something
        });
        return;
    }

    $.ajax({
        url: contextPath + "/food/addFood",
        method: 'post',
        data:{
            foodName: foodName,
            price: price,
            stars: stars
        },
        success(jsonStr){
            var result = eval("(" + jsonStr + ")");
            if (result.status == 1) {
                layer.alert(result.message, {
                    icon: 6
                },function() {
                    //关闭当前frame
                    xadmin.close();
                    xadmin.father_reload();
                });
            } else {
                layer.alert(result.message, {
                    icon: 5
                },function() {
                    xadmin.father_reload();
                });
            }

        }
    })
}

//通知管理部分
//删除通知
function delNotice(obj,id) {
    layer.confirm('确认要删除吗？',function(index){
        $.ajax({
            url: contextPath + "/notice/deleteNoticeById",
            method: 'post',
            data:{
                id: id
            },
            success: function (jsonStr) {
                var result = eval("("+jsonStr+")");
                if (result.status == 1){
                    //发异步删除数据
                    $(obj).parents("tr").remove();
                    layer.msg(result.message,{icon:1,time:1000});
                }else{
                    layer.msg(result.message,{icon:2,time:1000});
                }
            }
        });
    });
}


//发布通知
function addNotice() {
    var sendUid = $("#sendUid").val();
    //接收者id
    var receiveUids = [];
    var content = $("#content").val();

    $('input[name="userName"]:checked').each(function(){
        receiveUids.push($(this).val());
    });

    if (receiveUids.length == 0){
        layer.msg('请选择接收者', {
            icon: 2,
            time: 1000
        }, function(){
            //do something
        });
        return;
    }
    if (content == null || content == ''){
        layer.msg('请输入内容', {
            icon: 2,
            time: 1000
        }, function(){
            //do something
        });
        return;
    }

    $.ajax({
        url: contextPath + "/notice/addNotice",
        method: 'post',
        data: {
            sendUid: sendUid,
            receiveUids: receiveUids,
            content: content
        },
        success(jsonStr){
            var result = eval("(" + jsonStr + ")");
            if (result.status == 1) {
                layer.alert(result.message, {
                    icon: 6
                },function() {
                    //关闭当前frame
                    xadmin.close();
                    xadmin.father_reload();
                });
            } else {
                layer.alert(result.message, {
                    icon: 5
                },function() {
                    xadmin.father_reload();
                });
            }
        }
    })
}