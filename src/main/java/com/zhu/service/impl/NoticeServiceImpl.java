package com.zhu.service.impl;

import com.zhu.dao.NoticeMapper;
import com.zhu.dao.UserMapper;
import com.zhu.entity.Notice;
import com.zhu.entity.User;
import com.zhu.service.NoticeService;
import com.zhu.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {
    @Autowired
    public NoticeMapper noticeMapper;
    @Autowired
    public UserMapper userMapper;

    @Override
    public Page queryPageNotices(Integer currentPage, Integer sendUid, String content) {
        Page page = new Page();
        Integer totalCount = noticeMapper.queryTotalCount(sendUid, content);
        page.setTotalCount(totalCount);

        //页面合理范围
        if (currentPage <= 1){
            currentPage = 1;
        }
        if (currentPage >= totalCount){
            currentPage = totalCount;
        }
        page.setCurrentPage(currentPage);

        page.setUrl("/notice/queryPageNotices");
        List<User> userList = userMapper.querySendUsers();
        page.setUserList(userList);
        List<Notice> noticeList = noticeMapper.queryPageNotices(sendUid,content,(currentPage-1)*page.getPageSize(),page.getPageSize());
        if (noticeList.size() == 0){
            return page;
        }
        page.setNoticeList(noticeList);
        return page;
    }

    @Override
    public Integer deleteNoticeById(Integer id) {
        Integer i = noticeMapper.deleteNoticeById(id);
        return i;
    }

    @Override
    public Integer addNotice(Integer sendUid, Integer receiveUid, String content) {
        Integer i = noticeMapper.addNotice(sendUid, content, receiveUid);
        return i;
    }

}
