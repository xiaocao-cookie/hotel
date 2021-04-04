package com.zhu.controller;

import com.zhu.entity.User;
import com.zhu.service.UserService;
import com.zhu.util.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    public UserService userService;

    //去修改密码
    @RequestMapping("/toChangePassword")
    public String toChangePassword(){
        return "changePassword";
    }
    //修改密码
    @RequestMapping("/changePassword")
    public void changePassword(@RequestParam("newPassword") String newPassword,
                               @RequestParam("id") Integer id,
                               HttpServletResponse response)throws Exception{
        Integer i = userService.changePassword(id, newPassword);
        PrintWriter out = response.getWriter();
        if (i > 0){
            out.println("{'status':'1','message':'修改成功，请重新登录'}");
        }else {
            out.println("{'status':'2','message':'修改失败，是否继续修改'}");
        }
    }

    //点击找回密码去找回
    @RequestMapping("/toFindPassword")
    public String toFindPassword(){
        return "findPassword";
    }
    //找回密码
    @RequestMapping("/findPassword")
    public void findPassword(@RequestParam("param") String param,
                             HttpServletResponse response) throws Exception{
        String password1 = userService.findPasswordByLoginName(param);
        PrintWriter out = response.getWriter();
        if (password1 == null || password1 == ""){
            String password2 = userService.findPasswordByIdCard(param);
            if (password2 == null || password2 == ""){
                out.println("{'status':'2'}");
            }else{
                out.println("{'status':'1','message':"+password2+"}");
            }
        }else{
            out.println("{'status':'1','message':"+password1+"}");
        }
    }

    //跳转至个人信息页面
    @RequestMapping("/toPersonalInfo")
    public String toPersonalInfo(){
        return "personalInfo";
    }

    //分页查询
    @RequestMapping("/queryPageUsers")
    public String queryPageUsers(@RequestParam(value = "currentPage",defaultValue = "1") Integer currentPageNo,
                                 @RequestParam(value = "loginName",defaultValue = "") String loginName,
                                 @RequestParam(value = "idCard",defaultValue = "") String idCard,
                                 Model model){
        Page pager = userService.queryPageUsers(currentPageNo, loginName, idCard);
        List<User> userList = pager.getUserList();
        model.addAttribute("userList",userList);
        model.addAttribute("pager",pager);
        return "backend/member-list";
    }

    //根据用户id删除用户
    @RequestMapping("/deleteUserById")
    public void deleteUserById(@RequestParam(value = "id",required = false) Integer id,
                               @RequestParam(value = "ids[]",required = false) int[] ids,
                               HttpServletResponse response)throws Exception{
        PrintWriter out = response.getWriter();
        Integer result = 0;
        if (id != null){
            result = userService.deleteUserById(id);
            if (result > 0){
                out.println("{'status':'1','message':'删除成功'}");
            }else{
                out.println("{'status':'2','message':'删除失败'}");
            }
        }
        List<Integer> resultList = new ArrayList<>();
        if (ids != null && ids.length != 0 ){
            for (int i : ids) {
                result = userService.deleteUserById(i);
                if (result > 0){
                    resultList.add(1);
                }else{
                    resultList.add(2);
                }
            }
            out.println("{'resultList':"+resultList+"}");
        }
    }

    //后端的添加用户-去添加
    //添加用户与注册用户逻辑相同（RegisterController）
    @RequestMapping("/toAddUser")
    public String toAddUser(){
        return "backend/member-add";
    }
}