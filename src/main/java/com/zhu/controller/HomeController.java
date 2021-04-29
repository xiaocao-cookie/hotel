package com.zhu.controller;

import com.zhu.entity.Room;
import com.zhu.service.RoomService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/Home")
public class HomeController {

    @Resource
    public RoomService roomService;

    //跳转至前端首页
    @RequestMapping("/toFrontHome")
    public String toFrontHome(){
        return "../frontHome";
    }

    //跳转至后端主页
    @RequestMapping("/toBackendHome")
    public String toBackendHome(){
        return "index";
    }

    //跳转至后端后第一个显示的页面
    @RequestMapping("/toWelcome")
    public String toWelcome(){
        return "backend/welcome";
    }

    //跳转至酒店信息界面
    @RequestMapping("/toGetHotelInfo")
    public String toGetHotelInfo(){
        return "pre/hotelInfo";
    }

    //点击“我要入住”和“预约入住”跳转房间列表界面
    @RequestMapping("/goRoomList")
    public String goRoomList(Model model){
        List<Room> roomList = roomService.queryRoomList();
        model.addAttribute("roomList",roomList);
        return "pre/roomList";
    }

    //模糊查询(根据楼层，房态，装修风格)
    @RequestMapping("/queryLikeRoom")
    public String queryLikeRoom(@RequestParam("floor") Integer floor,
                                @RequestParam("status") String status,
                                @RequestParam("style") String style,
                                Model model){
        List<Room> roomList = roomService.queryLikeRoom(floor, status, style);
        model.addAttribute("roomList",roomList);
        return "pre/roomList";
    }
}