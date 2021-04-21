package com.zhu.service;

import com.zhu.entity.Notice;
import com.zhu.util.Page;

import java.util.Date;

public interface NoticeService {
    //分页查询
    public Page queryPageNotices(Integer currentPage, Integer sendUid,String content);
    //根据id删除通知
    public Integer deleteNoticeById(Integer id);
    //发布通知
    public Integer addNotice(Integer sendUid,Integer receiveUid,String content);
    //根据id查询通知
    public Notice queryNoticeById(Integer id);
    //更改通知
    public Integer updateNoticeById(Notice notice);
}
