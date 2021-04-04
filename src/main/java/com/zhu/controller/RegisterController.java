package com.zhu.controller;

import com.zhu.entity.User;
import com.zhu.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

@Controller
@RequestMapping("/Register")
public class RegisterController {
    @Resource
    public UserService userService;

    //验证登录名是否可用
    @RequestMapping("/verifyLoginName")
    public void verifyLoginName(@RequestParam("loginName") String loginName,
                                HttpServletResponse response)throws Exception{
        PrintWriter out = response.getWriter();
        String password = userService.findPasswordByLoginName(loginName);
        //如果没有信息的话，则可用
        if (password == null || "".equals(password)){
            out.println("{'status':'2'}");
        }else{
            out.println("{'status':'1'}");
        }
    }
    //验证身份证号是否重复
    @RequestMapping("/verifyIdCard")
    public void verifyIdCard(@RequestParam("idCard") String idCard,
                             HttpServletResponse response)throws Exception{
        PrintWriter out = response.getWriter();
        String password = userService.findPasswordByIdCard(idCard);
        //如果查询不到的话，可用
        if (password == null || "".equals(password)){
            out.println("{'status':'2'}");
        }else{
            out.println("{'status':'1'}");
        }
    }

    @RequestMapping("/toRegister")
    public String toRegister(){
        return "register";
    }

    @RequestMapping("/register")
    public void register(@RequestParam("loginName") String loginName,
                         @RequestParam("password") String password,
                         @RequestParam("sex") Integer sex,
                         @RequestParam("idCard") String idCard,
                         @RequestParam(value = "userType",defaultValue = "2") Integer userType,
                         HttpServletResponse response)throws Exception{
        User user = new User();
        user.setLoginName(loginName);
        user.setPassword(password);
        user.setSex(sex);
        user.setIdCard(idCard);
        user.setType(userType);
        Integer i = userService.register(user);
        PrintWriter out = response.getWriter();
        if (i > 0){
            out.println("{'status':'1','message':'注册成功'}");
        }else {
            out.println("{'status':'2','message':'注册失败'}");
        }

    }
}
