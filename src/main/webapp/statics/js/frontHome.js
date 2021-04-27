//房间列表页面
//点击确定并支付后触发的动作
function orderRoom(userId) {
    var rno = $("#rno").html();
    var startTime = $("#startTime").val();
    var endTime = $("#endTime").val();
    var price = $("#price").html();
    var count = $("#count").html();
    var cost = price*count;

    if (endTime == null || endTime == ""){
        layer.msg('结束日期不能为空', {
            icon: 2,
            time: 1500
        }, function(){
            //do something
        });
        return;
    }

    $.ajax({
        type: "post",
        url: contextPath+"/order/orderRoom?id="+rno+"&userId="+userId,
        data: {
            "startTime": startTime,
            "endTime": endTime,
            "cost": cost
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

//菜品列表页面
//点击确定并支付后触发的动作
function orderFood(userId) {
    var fid = $("#foodId").val();
    var quantity = $("#quantity").val();
    var initPrice = $("#initPrice").val();
    var cost = initPrice*quantity;

    if (quantity == null || quantity == ""){
        layer.msg('订餐数量不能为空', {
            icon: 2,
            time: 1500
        }, function(){
            //do something
        });
        return;
    }

    $.ajax({
        url: contextPath + "/order/orderFood",
        method: 'post',
        data: {
            userId: userId,
            fid: fid,
            quantity: quantity,
            cost: cost
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

//点击我要退租之后引发的动作
function cancelRoom(rno) {
    layer.confirm('确认要退租吗？',function(index) {
        $.ajax({
            url: contextPath + "/order/cancelRoom",
            method: 'post',
            data: {
                rno: rno
            },
            success(jsonStr) {
                var result = eval("(" + jsonStr + ")");
                if (result.status == 1) {
                    layer.alert(result.message, {
                        icon: 6
                    }, function (index) {
                        layer.close(index);
                        window.location.reload();
                    });
                } else {
                    layer.alert(result.message, {
                        icon: 5
                    }, function () {
                        xadmin.father_reload();
                    });
                }
            }
        })
    })
}

//我要续租,点击续租并支付
function renewRoom(id) {
    var startTime = $("#startTime").val();
    var endTime = $("#endTime").val();
    var cost = $("#cost").html();
    var price = $("#price").html();
    var count = $("#count").html();
    var totalCost = parseInt(cost) + (price*count);

    $.ajax({
        url: contextPath + "/order/renewRoom?id="+id,
        method: 'post',
        data:{
            "startTime": startTime,
            "endTime": endTime,
            "cost": totalCost
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
