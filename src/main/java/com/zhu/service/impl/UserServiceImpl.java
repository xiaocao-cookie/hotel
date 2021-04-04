package com.zhu.service.impl;

import com.zhu.dao.UserMapper;
import com.zhu.entity.User;
import com.zhu.service.UserService;
import com.zhu.util.Page;
import org.apache.commons.fileupload.util.LimitedInputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    public UserMapper userMapper;

    @Override
    public User login(User user) {
        User user1 = userMapper.login(user);
        return user1;
    }

    @Override
    public Integer register(User user) {
        Integer i = userMapper.register(user);
        return i;
    }

    @Override
    public Integer changePassword(Integer id, String newPassword) {
        Integer i = userMapper.changePassword(id, newPassword);
        return i;
    }

    @Override
    public String findPasswordByLoginName(String loginName) {
        String password = userMapper.findPasswordByLoginName(loginName);
        return password;
    }

    @Override
    public String findPasswordByIdCard(String idCard) {
        String password = userMapper.findPasswordByIdCard(idCard);
        return password;
    }

    @Override
    public Page queryPageUsers(Integer currentPageNo,String loginName,String idCard) {
        Page page = new Page();
        Integer totalCounts = userMapper.queryTotalCounts(loginName, idCard);
        page.setTotalCount(totalCounts);
        
        //判断页面合理范围
        if(currentPageNo <= 1){
            currentPageNo = 1;
        }
        if (currentPageNo >= page.getTotalCount()){
            currentPageNo = page.getTotalCount();
        }

        page.setCurrentPage(currentPageNo);
        page.setUrl("user/queryPageUsers");
        if (page.getTotalCount() == 0){
            return page;
        }
        List<User> userList = userMapper.queryPageUsers((currentPageNo-1)*page.getPageSize(),page.getPageSize(),loginName,idCard);
        page.setUserList(userList);
        return page;
    }

    @Override
    public Integer deleteUserById(Integer id) {
        Integer i = userMapper.deleteUserById(id);
        return i;
    }

    @Override
    public List<User> queryAllUsersEscapeId(Integer id) {
        List<User> userList = userMapper.queryAllUsersEscapeId(id);
        return userList;
    }
}