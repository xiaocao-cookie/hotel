package com.zhu.controller;

import com.zhu.entity.Room;
import com.zhu.service.RoomService;
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
@RequestMapping("/Room")
public class RoomController {
    @Resource
    public RoomService roomService;

    //去添加
    @RequestMapping("/toAddRoom")
    public String toAddRoom(){
        return "backend/room/room-add";
    }

    //添加房间
    @RequestMapping("/addRoom")
    public void addRoom(@RequestParam("roomName") String roomName,
                        @RequestParam("roomType") Integer roomType,
                        @RequestParam("status") String status,
                        @RequestParam("roomStyle") String roomStyle,
                        @RequestParam("roomFloor") Integer roomFloor,
                        HttpServletResponse response)throws Exception{
        PrintWriter out = response.getWriter();
        Room room = new Room();
        room.setRname(roomName);
        room.setRtype(roomType);
        room.setStatus(status);
        room.setRstyle(roomStyle);
        room.setRfloor(roomFloor);
        Integer i = roomService.addRoom(room);
        if (i > 0){
            out.println("{'status':'1','message':'添加成功'}");
        }else {
            out.println("{'status':'2','message':'添加失败'}");
        }
    }

    //修改房间
    @RequestMapping("/updateRoom")
    public void updateRoom(@RequestParam("rno") Integer rno,
                           @RequestParam("roomName") String roomName,
                           @RequestParam("roomType") Integer roomType,
                           @RequestParam("status") String status,
                           @RequestParam("roomStyle") String roomStyle,
                           @RequestParam("roomFloor") Integer roomFloor,
                           HttpServletResponse response)throws Exception{
        PrintWriter out = response.getWriter();
        Room room = new Room();
        room.setRname(roomName);
        room.setRtype(roomType);
        room.setStatus(status);
        room.setRstyle(roomStyle);
        room.setRfloor(roomFloor);
        room.setRno(rno);
        Integer j = roomService.updateRoom(room);
        if (j > 0){
            out.println("{'status':'1','message':'修改成功'}");
        }else {
            out.println("{'status':'2','message':'修改失败'}");
        }
    }

    //验证房间名是否重复
    @RequestMapping("/verifyRoomName")
    public void verifyRoomName(@RequestParam("roomName") String roomName,
                               HttpServletResponse response)throws Exception{
        PrintWriter out = response.getWriter();
        List<Room> roomList = roomService.verifyRoomName(roomName);
        if (roomList.size() != 0){
            out.println("{'status':'1'}");
        }else {
            out.println("{'status':'2'}");
        }
    }
    //分页查询
    @RequestMapping("/queryPageRooms")
    public String queryPageRooms(@RequestParam(value = "roomName",required = false) String roomName,
                                 @RequestParam(value = "status",required = false) String status,
                                 @RequestParam(value = "roomType",required = false) Integer roomType,
                                 @RequestParam(value = "roomStyle",required = false) String roomStyle,
                                 @RequestParam(value = "currentPage",defaultValue = "1") Integer currPageNo,
                                 Model model){
        model.addAttribute("roomName",roomName);
        model.addAttribute("status",status);
        model.addAttribute("roomType",roomType);
        model.addAttribute("roomStyle",roomStyle);
        Page pager = roomService.queryPageRooms(currPageNo,roomName,status,roomType,roomStyle);
        List<Room> roomList = pager.getRoomList();
        model.addAttribute("roomList",roomList);
        model.addAttribute("pager",pager);
        return "backend/room/room-list";
    }

    //删除某个房间
    @RequestMapping("/deleteRoomById")
    public void deleteRoomById(@RequestParam("id") Integer id,
                               HttpServletResponse response)throws Exception{
        PrintWriter out = response.getWriter();
        Integer i = roomService.deleteRoomById(id);
        if (i > 0){
            out.println("{'status':'1','message':'删除成功'}");
        }else {
            out.println("{'status':'2','message':'删除失败'}");
        }
    }

    //房屋修改--去修改
    @RequestMapping("/toUpdateRoom")
    public String toUpdateRoom(@RequestParam("rno") Integer rno,
                               Model model){
        Room room = roomService.queryRoomByRno(rno);
        model.addAttribute("rno",rno);
        model.addAttribute("roomName",room.getRname());
        model.addAttribute("roomType",room.getRtype());
        model.addAttribute("status",room.getStatus());
        model.addAttribute("roomStyle",room.getRstyle());
        model.addAttribute("images",room.getPicPath());
        model.addAttribute("roomFloor",room.getRfloor());
        return "backend/room/room-edit";
    }
}
