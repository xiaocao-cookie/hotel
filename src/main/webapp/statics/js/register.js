//Demo
layui.use('form', function(){
    var form = layui.form;
});
//注册的登录名失去焦点时触发的动作
$("input[name='loginName']").blur(function () {
    var loginName = $("input[name='loginName']").val();
    $.ajax({
        url: contextPath + "/Register/verifyLoginName",
        method: "post",
        data:{
            loginName:loginName
        },
        success(jsonStr){
            var result = eval("(" + jsonStr + ")");
            if (result.status == 2){
                $("#loginNameClose").hide();
                $("#loginNameOk").show();
            }else{
                $("#loginNameOk").hide();
                $("#loginNameClose").show();
            }
        }
    })
});
//注册的身份证号失去焦点时触发的动作
$("input[name='idCard']").blur(function () {
    var idCard = $("input[name='idCard']").val();
    $.ajax({
        url: contextPath + "/Register/verifyIdCard",
        method: "post",
        data:{
            idCard:idCard
        },
        success(jsonStr){
            var result = eval("(" + jsonStr + ")");
            if (result.status == 2){
                $("#idCardClose").hide();
                $("#idCardOk").show();
            }else{
                $("#idCardOk").hide();
                $("#idCardClose").show();
            }
        }
    })
});
//点击注册触发的动作
function register() {
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
                layer.msg(result.message, {
                    icon: 1,//成功的表情
                    time: 2000
                },function () {
                    window.location.href = contextPath + "/Login/toLogin";
                });
            } else {
                layer.msg(result.message, {
                    icon: 2,
                    time: 2000
                },function () {
                    window.location.reload();
                });
            }
        }
    })
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