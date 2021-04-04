package com.zhu.dao;

import com.zhu.entity.Notice;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface NoticeMapper {
    //分页查询
    public List<Notice> queryPageNotices(@Param("sendUid") Integer sendUid,
                                         @Param("content") String content,
                                         @Param("from") Integer from,
                                         @Param("pageSize") Integer pageSize);
    //查询数量
    public Integer queryTotalCount(@Param("sendUid") Integer sendUid,
                                   @Param("content") String content);
    //通过id删除通知
    public Integer deleteNoticeById(Integer id);
    //发布（添加）通知
    public Integer addNotice(@Param("sendUid") Integer sendUid,
                             @Param("content") String content,
                             @Param("receiveUid") Integer receiveUid);
}
