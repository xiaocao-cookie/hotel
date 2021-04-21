package com.zhu.dao;

import com.zhu.entity.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleMapper {
    //查询记录总条数
    public Integer queryTotalCount();
    //分页查询
    public List<Role> queryPageRoles(@Param("from") Integer from,
                                     @Param("pageSize") Integer pageSize);
    //根据id删除角色
    public Integer deleteRoleById(Integer id);
    //根据角色id查询该角色下是否有用户
    public Integer queryUsersByRoleId(Integer id);
    //启用或停用角色
    public Integer startOrStopRoleById(@Param("id") Integer id,
                                        @Param("status") Integer status);
    //验证角色名是否重复
    public List<Role> verifyRoleName(String roleName);
    //添加角色
    public Integer addRole(Role role);
    //根据id查询角色信息
    public Role queryRoleById(Integer id);
    //更新角色信息
    public Integer updateRole(Role role);
}
