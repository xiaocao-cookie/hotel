package com.zhu.service.impl;

import com.zhu.dao.RoleMapper;
import com.zhu.entity.Role;
import com.zhu.service.RoleService;
import com.zhu.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    public RoleMapper roleMapper;

    @Override
    public Page queryPageRoles(Integer currentPage) {
        Page page = new Page();
        Integer totalCount = roleMapper.queryTotalCount();
        page.setTotalCount(totalCount);

        if (currentPage <= 1){
            currentPage = 1;
        }else if (currentPage > page.getPageCount()){
            currentPage = page.getPageCount();
        }
        page.setCurrentPage(currentPage);

        page.setUrl("/admin/getAdminRole");
        List<Role> roleList = roleMapper.queryPageRoles((currentPage-1)*page.getPageSize(),page.getPageSize());
        if (roleList.size() == 0){
            return page;
        }
        page.setRoleList(roleList);
        return page;
    }

    @Override
    public Integer deleteRoleById(Integer id) {
        Integer i = roleMapper.deleteRoleById(id);
        return i;
    }

    @Override
    public Integer queryUsersByRoleId(Integer id) {
        Integer i = roleMapper.queryUsersByRoleId(id);
        return i;
    }

    @Override
    public Integer startOrStopRoleById(Integer id, Integer status) {
        Integer i = roleMapper.startOrStopRoleById(id,status);
        return i;
    }

    @Override
    public List<Role> verifyRoleName(String roleName) {
        List<Role> roleList = roleMapper.verifyRoleName(roleName);
        return roleList;
    }

    @Override
    public Integer addRole(Role role) {
        Integer i = roleMapper.addRole(role);
        return i;
    }

    @Override
    public Role queryRoleById(Integer id) {
        Role role = roleMapper.queryRoleById(id);
        return role;
    }

    @Override
    public Integer updateRole(Role role) {
        Integer i = roleMapper.updateRole(role);
        return i;
    }
}
