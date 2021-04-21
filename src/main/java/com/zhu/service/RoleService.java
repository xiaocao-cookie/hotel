package com.zhu.service;

import com.zhu.entity.Role;
import com.zhu.util.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleService {
    //分页查询
    public Page queryPageRoles(Integer currentPage);
    public Integer deleteRoleById(Integer id);
    //根据角色id查询该角色下是否有用户
    public Integer queryUsersByRoleId(Integer id);
    //启用或停用角色
    public Integer startOrStopRoleById(Integer id,Integer status);
    //验证角色名是否重复
    public List<Role> verifyRoleName(String roleName);
    //添加角色
    public Integer addRole(Role role);
    //根据id查询角色信息
    public Role queryRoleById(Integer id);
    //更新角色信息
    public Integer updateRole(Role role);
}
