package com.zhu.service;

import com.zhu.entity.Room;
import com.zhu.util.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoomService {
    //查询所有房间(前台首页使用)
    public List<Room> queryRoomList();
    //按条件查询（包括楼层，房态，装修风格）
    public List<Room> queryLikeRoom(Integer floor,String status, String style);
    //分页查询
    public Page queryPageRooms(Integer currPageNo, String rname, String status, Integer rtype, String rstyle);
    //根据房间号删除房间
    public Integer deleteRoomById(Integer rno);
    //验证房间名是否可用
    public List<Room> verifyRoomName(String rname);
    //添加房间
    public Integer addRoom(Room room);
}