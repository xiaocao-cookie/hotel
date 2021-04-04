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
import javax.jws.WebParam;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.Date;
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
        return "backend/notice-list";
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
        return "backend/notice-add";
    }

    //发布通知
    @RequestMapping("/addNotice")
    public void addNotice(@RequestParam("sendUid") Integer sendUid,
                          @RequestParam("receiveUids[]") Integer[] receiveUids,
                          @RequestParam("content") String content,
                          HttpServletResponse response)throws Exception{
        PrintWriter out = response.getWriter();
        for (Integer receiveUid : receiveUids) {
            Integer i = noticeService.addNotice(sendUid,receiveUid,content);
            if (i <= 0){
                out.println("{'status':'2','message':'发布失败'}");
            }
        }
        out.println("{'status':'1','message':'发布成功'}");
    }


}
