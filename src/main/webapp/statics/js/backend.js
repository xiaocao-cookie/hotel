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
                    layer.alert(result.message, {
                        icon: 1
                    }, function (index) {
                        layer.close(index);
                        window.location.reload();
                    });
                }else{
                    layer.msg(result.message,{icon:2,time:1000});
                }
            }
        });
    });
}

//表格上方的批量删除按钮(用户-批量删除)
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
                layer.alert('删除成功', {
                    icon: 6
                }, function (index) {
                    layer.close(index);
                    window.location.reload();
                });
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

//管理员修改用户信息
function updateUser() {
//获取相关字段的值
    var id = $("input[name='userId']").val();
    var loginName = $("input[name='loginName']").val();
    var password = $("input[name='password']").val();
    var sex = $("input[name='sex']:checked").val();
    var idCard = $("input[name='idCard']").val();
    var userType = $("#userType option:selected").val();

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
        url: contextPath + "/user/updateUser",
        method: "post",
        data: {
            id: id,
            loginName: loginName,
            password: password,
            sex: sex,
            idCard: idCard,
            userType: userType
        },
        success: function (jsonStr) {
            var result = eval("(" + jsonStr + ")");
            if (result.status == 1) {
                layer.alert("修改成功", {
                    icon: 6
                },function() {
                    //关闭当前frame
                    xadmin.close();
                    xadmin.father_reload();
                });
            } else {
                layer.alert("修改失败", {
                    icon: 5
                },function() {
                    xadmin.father_reload();
                });
            }
        }
    });
}

//用户修改个人信息
function modifyInfo() {
    var id = $("#userId").val();
    var oldLoginName = $("#oldLoginName").val();
    var loginName = $("input[name='loginName']").val();
    var sex = $("input[name='sex']:checked").val();
    var oldIdCard = $("#oldIdCard").val();
    var idCard = $("input[name='idCard']").val();

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
        url: contextPath + "/user/modifyInfo",
        method: "post",
        data: {
            id: id,
            loginName: loginName,
            sex: sex,
            idCard: idCard,
        },
        success: function (jsonStr) {
            var result = eval("(" + jsonStr + ")");
            if (result.status == 1) {
                layer.alert("修改成功", {
                    icon: 6
                },function() {
                    if (oldLoginName != loginName || oldIdCard != idCard){
                        layer.open({
                            content:'请重新登录',
                            icon: 6,
                            closeBtn: 0,
                            btn: ['去登录'] //可以无限个按钮
                            ,yes: function(index,layero){
                                window.parent.parent.location.href = contextPath + "/Login/toLogin";
                            }});
                        return;
                    }
                    //关闭当前frame
                    xadmin.close();
                    window.parent.parent.location.reload();
                });
            } else {
                layer.alert("修改失败", {
                    icon: 5
                },function() {
                    xadmin.father_reload();
                });
            }
        }
    });


}

//房间管理部分
//房屋添加
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

//房屋修改
function updateRoom() {
    var rno = $("#rno").val();
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
        url: contextPath + "/Room/updateRoom",
        method: 'post',
        data: {
            rno: rno,
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
                    layer.alert(result.message, {
                        icon: 6
                    }, function (index) {
                        layer.close(index);
                        window.location.reload();
                    });
                }else{
                    layer.msg(result.message,{icon:2,time:1000});
                }
            }
        });
    });
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
                    layer.alert(result.message, {
                        icon: 6
                    }, function (index) {
                        layer.close(index);
                        window.location.reload();
                    });
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

//菜品修改
function updateFood() {
    var id = $("#foodId").val();
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
        url: contextPath + "/food/updateFood",
        method: 'post',
        data:{
            id: id,
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
                    layer.alert(result.message, {
                        icon: 6
                    }, function (index) {
                        layer.close(index);
                        window.location.reload();
                    });
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
    var nReceiveUid = $("#nReceiveId").val();

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
            nReceiveUid: nReceiveUid,
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

//修改通知
function updateNotice() {
    var id = $("#noticeId").val();
    var sendUid = $("#sendUid").val();
    //接收者id
    var receiveUids = [];
    var content = $("#content").val();
    var nReceiveUid = $("#nReceiveId").val();

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
        url: contextPath + "/notice/updateNotice",
        method: 'post',
        data: {
            id: id,
            sendUid: sendUid,
            nReceiveUid: nReceiveUid,
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

//管理员管理部分
//删除角色
function delRole(obj,id) {
    layer.confirm('确认要删除吗？',function(index){
        $.ajax({
            url: contextPath + "/admin/deleteRoleById",
            method: 'post',
            data:{
                id: id
            },
            success: function (jsonStr) {
                var result = eval("("+jsonStr+")");
                if (result.status == 1){
                    //发异步删除数据
                    $(obj).parents("tr").remove();
                    layer.alert(result.message, {
                        icon: 6
                    }, function (index) {
                        layer.close(index);
                        window.location.reload();
                    });
                }else{
                    layer.msg(result.message,{icon:2,time:2000});
                }
            }
        });
    });
}

//用户停用或启用
/*用户-停用*/
function role_stop(obj,tips,id){
    layer.confirm('确认要'+tips+'吗？',function(index){

        //停用角色
        if(tips=='停用'){

            //发异步把用户状态进行更改
            $(obj).find('i').html('&#xe62f;');

            $.ajax({
               url: contextPath + "/admin/startOrStopRole",
                method: 'post',
                data:{
                   id: id,
                   status: 0
                },
                success(jsonStr){
                   var result = eval("("+jsonStr+")");
                   if (result.status == 1){
                       $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                       layer.msg('已停用!',{icon: 5,time:1000});
                   }else{
                       layer.msg('操作失败,请联系管理员',{icon: 5,time:1000});
                   }
                }
            });
        }else{
            //启用角色
            $(obj).find('i').html('&#xe601;');

            $.ajax({
                url: contextPath + "/admin/startOrStopRole",
                method: 'post',
                data:{
                    id: id,
                    status: 1
                },
                success(jsonStr){
                    var result = eval("("+jsonStr+")");
                    if (result.status == 1){
                        $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                        layer.msg('已启用!',{icon: 6,time:1000});
                    }else{
                        layer.msg('操作失败,请联系管理员',{icon: 5,time:1000});
                    }
                }
            });
        }
    });
}

//添加角色
function addRole() {
    var roleName = $("input[name='roleName']").val();
    var roleAuth = $("input[name='roleAuth']").val();
    var desc = $("#desc").val();
    var status = $("input:radio:checked").val();

    if (roleName == null || roleName == ""){
        layer.msg('角色名称不能为空', {
            icon: 2,
            time: 1000
        }, function(){
            //do something
        });
        return;
    }

    if (roleAuth == null || roleAuth == ""){
        layer.msg('权限规则不能为空', {
            icon: 2,
            time: 1000
        }, function(){
            //do something
        });
        return;
    }

    if (desc == null || desc == ""){
        layer.msg('权限描述不能为空', {
            icon: 2,
            time: 1000
        }, function(){
            //do something
        });
        return;
    }

    $.ajax({
        url: contextPath + "/admin/addRole",
        method: 'post',
        data:{
            roleName: roleName,
            roleAuth: roleAuth,
            desc: desc,
            status: status
        },
        success(jsonStr){
            var result = eval("("+jsonStr+")");
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

//修改角色
function updateRole() {
    var id = $("#roleId").val();
    var roleName = $("input[name='roleName']").val();
    var roleAuth = $("input[name='roleAuth']").val();
    var desc = $("#desc").val();
    var status = $("input:radio:checked").val();

    if (roleName == null || roleName == ""){
        layer.msg('角色名称不能为空', {
            icon: 2,
            time: 1000
        }, function(){
            //do something
        });
        return;
    }

    if (roleAuth == null || roleAuth == ""){
        layer.msg('权限规则不能为空', {
            icon: 2,
            time: 1000
        }, function(){
            //do something
        });
        return;
    }

    if (desc == null || desc == ""){
        layer.msg('权限描述不能为空', {
            icon: 2,
            time: 1000
        }, function(){
            //do something
        });
        return;
    }

    $.ajax({
        url: contextPath + "/admin/updateRole",
        method: 'post',
        data:{
            id: id,
            roleName: roleName,
            roleAuth: roleAuth,
            desc: desc,
            status: status
        },
        success(jsonStr){
            var result = eval("("+jsonStr+")");
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

//订单管理 -- 删除房间订单
function delRoomOrder(obj,id) {
    layer.confirm('确认要删除吗？',function(index){
        $.ajax({
            url: contextPath + "/order/deleteRoomOrderById",
            method: 'post',
            data:{
                id: id
            },
            success: function (jsonStr) {
                var result = eval("("+jsonStr+")");
                if (result.status == 1){
                    //发异步删除数据
                    $(obj).parents("tr").remove();
                    layer.alert(result.message, {
                        icon: 6
                    }, function (index) {
                        layer.close(index);
                        window.location.reload();
                    });
                }else{
                    layer.msg(result.message,{icon:2,time:2000});
                }
            }
        });
    });
}

//订单管理 -- 删除菜品订单
function delFoodOrder(obj,id) {
    layer.confirm('确认要删除吗？',function(index){
        $.ajax({
            url: contextPath + "/order/deleteFoodOrderById",
            method: 'post',
            data:{
                id: id
            },
            success: function (jsonStr) {
                var result = eval("("+jsonStr+")");
                if (result.status == 1){
                    //发异步删除数据
                    $(obj).parents("tr").remove();
                    layer.alert(result.message, {
                        icon: 6
                    }, function (index) {
                        layer.close(index);
                        window.location.reload();
                    });
                }else{
                    layer.msg(result.message,{icon:2,time:2000});
                }
            }
        });
    });
}