package com.zhu.controller;

import com.zhu.entity.User;
import com.zhu.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/Login")
public class LoginController {
    @Resource
    public UserService userService;

    //去登录
    @RequestMapping("/toLogin")
    public String toLogin(){
        return "login";
    }
    //登录
    @RequestMapping("/login")
    public String login(@RequestParam("loginName") String loginName,
                        @RequestParam("password") String password,
                        HttpSession session){
        User user = new User();
        user.setLoginName(loginName);
        user.setPassword(password);
        User user1 = userService.login(user);
        if (user1 != null){
            session.setAttribute("loginUser",user1);
            if(user1.getType() == 2){
                return "../frontHome";
            }else{
                return "index";
            }
        }else {
            return "login";
        }
    }
    //登出系统
    @RequestMapping("/loginOut")
    public String loginOut(HttpSession session){
        session.removeAttribute("loginUser");
        return "login";
    }
}