package com.zhu.dao;

import com.zhu.entity.Room;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoomMapper {
    //查询所有房间(前台首页使用)
    public List<Room> queryRoomList();
    //按条件查询（包括楼层，房态，装修风格）
    public List<Room> queryLikeRoom(@Param("floor") Integer floor,
                                    @Param("status") String status,
                                    @Param("style") String style);
    //查询房间总数量
    public Integer queryTotalCount(@Param("rname") String rname,
                                   @Param("status") String status,
                                   @Param("rtype") Integer rtype,
                                   @Param("rstyle") String rstyle);
    //分页查询
    public List<Room> queryPageRooms(@Param("rname") String rname,
                                     @Param("status") String status,
                                     @Param("rtype") Integer rtype,
                                     @Param("rstyle") String rstyle,
                                     @Param("from") Integer from,
                                     @Param("pageSize") Integer pageSize);
    //根据房间号删除房间
    public Integer deleteRoomById(Integer rno);
    //验证房间名是否可用
    public List<Room> verifyRoomName(String rname);
    //添加房间
    public Integer addRoom(Room room);
    //通过房间号查询房间信息
    public Room queryRoomByRno(Integer rno);
    //修改房间信息
    public Integer updateRoom(Room room);
}
