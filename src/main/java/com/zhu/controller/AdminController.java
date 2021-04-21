package com.zhu.controller;

import com.zhu.entity.Role;
import com.zhu.entity.User;
import com.zhu.service.RoleService;
import com.zhu.service.UserService;
import com.zhu.util.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Resource
    public UserService userService;
    @Resource
    public RoleService roleService;

    //管理员列表
    @RequestMapping("/getAdminList")
    public String getAdminList(Model model){
        List<User> adminList = userService.queryAdminList();
        model.addAttribute("adminList",adminList);
        return "backend/admin/admin-list";
    }

    //角色管理
    @RequestMapping("/getAdminRole")
    public String getAdminRole(@RequestParam(value = "currentPage",defaultValue = "1") Integer currentPage,
                               Model model){
        Page pager = roleService.queryPageRoles(currentPage);
        List<Role> roleList = pager.getRoleList();
        model.addAttribute("roleList",roleList);
        model.addAttribute("pager",pager);
        return "backend/admin/admin-role";
    }

    //根据id删除角色
    @RequestMapping("/deleteRoleById")
    public void deleteRoleById(@RequestParam("id") Integer id,
                               HttpServletResponse response) throws Exception{
        PrintWriter out = response.getWriter();
        Integer j = roleService.queryUsersByRoleId(id);
        if (j == 0){
            Integer i = roleService.deleteRoleById(id);
            if (i > 0){
                out.println("{'status':'1','message':'删除成功'}");
            }else{
                out.println("{'status':'2','message':'删除失败'}");
            }
        }else{
            out.println("{'status':'2','message':'仍有用户享有该角色权益'}");
        }
    }

    //停用或启用角色
    @RequestMapping("/startOrStopRole")
    public void startOrStopRole(@RequestParam("id") Integer id,
                                @RequestParam("status") Integer status,
                                HttpServletResponse response)throws Exception{
        PrintWriter out = response.getWriter();
        Integer i = roleService.startOrStopRoleById(id, status);
        if (i > 0){
            out.println("{'status':'1'}");
        }else{
            out.println("{'status':'2'}");
        }
    }

    //添加角色（去添加）
    @RequestMapping("/toAddRole")
    public String toAddRole(){
        return "backend/admin/admin-roleAdd";
    }

    //添加角色
    @RequestMapping("/addRole")
    public void addRole(@RequestParam("roleName") String roleName,
                        @RequestParam("roleAuth") String roleAuth,
                        @RequestParam("desc") String desc,
                        @RequestParam("status") Integer status,
                        HttpServletResponse response)throws Exception{
        PrintWriter out = response.getWriter();
        Role role = new Role();
        role.setRoleName(roleName);
        role.setRoleAuth(roleAuth);
        role.setDesc(desc);
        role.setStatus(status);
        Integer i = roleService.addRole(role);
        if (i > 0){
            out.println("{'status':'1','message':'添加成功'}");
        }else{
            out.println("{'status':'2','message':'添加失败'}");
        }
    }

    //更新角色
    @RequestMapping("/updateRole")
    public void updateRole(@RequestParam("id") Integer id,
                           @RequestParam("roleName") String roleName,
                           @RequestParam("roleAuth") String roleAuth,
                           @RequestParam("desc") String desc,
                           @RequestParam("status") Integer status,
                           HttpServletResponse response)throws Exception{
        PrintWriter out = response.getWriter();
        Role role = new Role();
        role.setRoleName(roleName);
        role.setRoleAuth(roleAuth);
        role.setDesc(desc);
        role.setStatus(status);
        role.setId(id);
        Integer j = roleService.updateRole(role);
        if (j > 0){
            out.println("{'status':'1','message':'修改成功'}");
        }else{
            out.println("{'status':'2','message':'修改失败'}");
        }
    }

    //验证角色名是否重复
    @RequestMapping("/verifyRoleName")
    public void verifyRoleName(@RequestParam("roleName") String roleName,
                               HttpServletResponse response) throws Exception{
        PrintWriter out = response.getWriter();
        List<Role> roleList = roleService.verifyRoleName(roleName);
        if (roleList.size() != 0){
            out.println("{'status':'1'}");
        }else{
            out.println("{'status':'2'}");
        }
    }

    //管理员编辑--去编辑
    @RequestMapping("/toUpdateAdmin")
    public String toUpdateAdmin(@RequestParam("id") Integer id,
                                Model model){
        User user = userService.queryUserById(id);
        model.addAttribute("id",id);
        model.addAttribute("loginName",user.getLoginName());
        model.addAttribute("password",user.getPassword());
        model.addAttribute("sex",user.getSex());
        model.addAttribute("idCard",user.getIdCard());
        model.addAttribute("userType",user.getType());
        return "backend/admin/admin-edit";
    }

    //角色编辑--去编辑
    @RequestMapping("/toUpdateRole")
    public String toUpdateRole(@RequestParam("id") Integer id,
                               Model model){
        Role role = roleService.queryRoleById(id);
        model.addAttribute("role",role);
        return "backend/admin/admin-roleEdit";
    }
}
