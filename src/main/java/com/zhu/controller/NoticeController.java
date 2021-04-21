package com.zhu.controller;

import com.zhu.entity.Notice;
import com.zhu.entity.User;
import com.zhu.service.NoticeService;
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
@RequestMapping("/notice")
public class NoticeController {
    @Resource
    public NoticeService noticeService;
    @Resource
    public UserService userService;

    //分页查询
    @RequestMapping("/queryPageNotices")
    public String queryPageNotices(@RequestParam(value = "currentPage",defaultValue = "1") Integer currentPage,
                                   @RequestParam(value = "sendName",required = false) Integer sendUid,
                                   @RequestParam(value = "content",required = false) String content,
                                   Model model){
        model.addAttribute("sendUid",sendUid);
        Page pager = noticeService.queryPageNotices(currentPage, sendUid, content);
        List<Notice> noticeList = pager.getNoticeList();
        List<User> userList = pager.getUserList();
        model.addAttribute("pager",pager);
        model.addAttribute("noticeList",noticeList);
        model.addAttribute("userList",userList);
        return "backend/notice/notice-list";
    }
    //删除通知
    @RequestMapping("/deleteNoticeById")
    public void deleteNoticeById(@RequestParam("id") Integer id,
                                 HttpServletResponse response)throws Exception{
        PrintWriter out = response.getWriter();
        Integer i = noticeService.deleteNoticeById(id);
        if(i > 0){
            out.println("{'status':'1','message':'删除成功'}");
        }else{
            out.println("{'status':'2','message':'删除失败'}");
        }
    }

    //去发布（添加）通知
    @RequestMapping("/toAddNotice")
    public String toAddNotice(@RequestParam("id") Integer id, Model model){
        List<User> userList = userService.queryAllUsersEscapeId(id);
        model.addAttribute("userList",userList);
        return "backend/notice/notice-add";
    }

    //发布通知
    @RequestMapping("/addNotice")
    public void addNotice(@RequestParam(value = "id",required = false) Integer id,
                          @RequestParam("sendUid") Integer sendUid,
                          @RequestParam("receiveUids[]") Integer[] receiveUids,
                          @RequestParam("content") String content,
                          HttpServletResponse response)throws Exception{
        PrintWriter out = response.getWriter();
        Notice notice = new Notice();
        notice.setId(id);
        notice.setNSendUid(sendUid);
        notice.setContent(content);
        for (Integer receiveUid : receiveUids) {
            Integer i = noticeService.addNotice(sendUid,receiveUid,content);
            if (i <= 0){
                out.println("{'status':'2','message':'发布失败'}");
            }
        }
        out.println("{'status':'1','message':'发布成功'}");

    }

    //修改通知--修改
    @RequestMapping("/updateNotice")
    public void updateNotice(@RequestParam(value = "id",required = false) Integer id,
                             @RequestParam("sendUid") Integer sendUid,
                             @RequestParam("nReceiveUid") Integer nReceiveUid,
                             @RequestParam("receiveUids[]") Integer[] receiveUids,
                             @RequestParam("content") String content,
                             HttpServletResponse response)throws Exception{
        PrintWriter out = response.getWriter();
        Notice notice = new Notice();
        notice.setId(id);
        notice.setNSendUid(sendUid);
        notice.setContent(content);
        if (receiveUids.length == 1){
            notice.setNReceiveUid(receiveUids[0]);
            Integer j = noticeService.updateNoticeById(notice);
            if (j > 0){
                out.println("{'status':'1','message':'修改成功'}");
            }else {
                out.println("{'status':'2','message':'修改失败'}");
            }
        }else{
            for (Integer receiveUid : receiveUids) {
                if (receiveUid == nReceiveUid){
                    Integer j = noticeService.deleteNoticeById(id);
                }
                Integer i = noticeService.addNotice(sendUid,receiveUid,content);
                if (i <= 0){
                    out.println("{'status':'2','message':'修改失败'}");
                }
            }
            out.println("{'status':'1','message':'修改成功'}");
        }
    }

    //修改通知--去修改
    @RequestMapping("/toUpdateNotice")
    public String toUpdateNotice(@RequestParam("id") Integer id,
                                 Model model){
        Notice notice = noticeService.queryNoticeById(id);
        model.addAttribute("id",id);
        model.addAttribute("nSendUid",notice.getNSendUid());
        model.addAttribute("nReceiveUid",notice.getNReceiveUid());
        User sendUser = userService.queryUserById(notice.getNSendUid());
        model.addAttribute("nSendName",sendUser.getLoginName());
        List<User> userList = userService.queryAllUsersEscapeId(id);
        model.addAttribute("userList",userList);
        User receiveUser = userService.queryUserById(notice.getNReceiveUid());
        model.addAttribute("nReceiveName",receiveUser.getLoginName());
        model.addAttribute("content",notice.getContent());
        return "backend/notice/notice-edit";
    }

}
