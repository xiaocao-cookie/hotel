package com.zhu.service;

import com.zhu.entity.User;
import com.zhu.util.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService {
    //查询登录信息是否正确
    public User login(User user);
    //注册用户
    public Integer register(User user);
    //修改密码
    public Integer changePassword(@Param("id") Integer id,
                                  @Param("newPassword") String newPassword);
    //根据用户名找回密码
    public String findPasswordByLoginName(String loginName);
    //根据身份证号找回密码
    public String findPasswordByIdCard(String idCard);
    //分页查询
    public Page queryPageUsers(Integer currentPageNo,String loginName,String idCard);
    //根据用户id删除用户
    public Integer deleteUserById(Integer id);
    //查询所有用户(除登录的用户id外，用于发布通知)
    public List<User> queryAllUsersEscapeId(Integer id);
    //查询管理员列表
    public List<User> queryAdminList();
    //通过id查询用户
    public User queryUserById(Integer id);
    //修改用户
    public Integer updateUser(User user);
    //用户修改个人信息
    public Integer modifyInfo(User user);
}
