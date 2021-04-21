package com.zhu.service.impl;

import com.zhu.dao.PriceMapper;
import com.zhu.dao.RoomMapper;
import com.zhu.entity.Room;
import com.zhu.service.RoomService;
import com.zhu.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class RoomServiceImpl implements RoomService {

    @Autowired
    public RoomMapper roomMapper;
    @Autowired
    public PriceMapper priceMapper;

    @Override
    public List<Room> queryRoomList() {
        List<Room> roomList = roomMapper.queryRoomList();
        for (Room room : roomList) {
            Integer price = priceMapper.queryPriceByType(room.getRtype());
            room.setPrice(price);
        }
        return roomList;
    }

    @Override
    public List<Room> queryLikeRoom(Integer floor, String status, String style) {
        List<Room> roomList = roomMapper.queryLikeRoom(floor, status, style);
        for (Room room : roomList) {
            Integer price = priceMapper.queryPriceByType(room.getRtype());
            room.setPrice(price);
        }
        return roomList;
    }

    @Override
    public Page queryPageRooms(Integer currPageNo, String rname, String status, Integer rtype, String rstyle) {
        Page page = new Page();
        Integer totalcount = roomMapper.queryTotalCount(rname, status, rtype, rstyle);
        page.setTotalCount(totalcount);

        //页面合理范围
        if (currPageNo <= 1){
            currPageNo = 1;
        }else if (currPageNo > page.getPageCount()){
            currPageNo = page.getPageCount();
        }

        page.setCurrentPage(currPageNo);
        page.setUrl("/Room/queryPageRooms");
        if (page.getTotalCount() == 0){
            return page;
        }
        List<Room> roomList = roomMapper.queryPageRooms(rname, status, rtype, rstyle,(currPageNo-1)*page.getPageSize(),page.getPageSize());
        page.setRoomList(roomList);
        return page;
    }

    @Override
    public Integer deleteRoomById(Integer rno) {
        Integer i = roomMapper.deleteRoomById(rno);
        return i;
    }

    @Override
    public List<Room> verifyRoomName(String rname) {
        List<Room> roomList = roomMapper.verifyRoomName(rname);
        return roomList;
    }

    @Override
    public Integer addRoom(Room room) {
        Integer i = roomMapper.addRoom(room);
        return i;
    }

    @Override
    public Room queryRoomByRno(Integer rno) {
        Room room = roomMapper.queryRoomByRno(rno);
        return room;
    }

    @Override
    public Integer updateRoom(Room room) {
        Integer i = roomMapper.updateRoom(room);
        return i;
    }
}
