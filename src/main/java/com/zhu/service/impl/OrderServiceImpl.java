package com.zhu.service.impl;

import com.zhu.dao.OrderMapper;
import com.zhu.entity.FoodOrder;
import com.zhu.entity.Room;
import com.zhu.entity.RoomOrder;
import com.zhu.entity.User;
import com.zhu.service.OrderService;
import com.zhu.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    public OrderMapper orderMapper;

    @Override
    public Integer orderRoom(RoomOrder roomOrder) {
        Integer i = orderMapper.orderRoom(roomOrder);
        return i;
    }

    @Override
    public Integer orderFood(FoodOrder foodOrder) {
        Integer i = orderMapper.orderFood(foodOrder);
        return i;
    }

    @Override
    public List<RoomOrder> queryRoomsByUserId(Integer userId) {
        List<RoomOrder> roomOrderList = orderMapper.queryRoomsByUserId(userId);
        return roomOrderList;
    }

    @Override
    public Integer deleteRoomOrderByRno(Integer rno) {
        Integer i = orderMapper.deleteRoomOrderByRno(rno);
        return i;
    }

    @Override
    public RoomOrder queryRoomOrderById(Integer id) {
        RoomOrder roomOrder = orderMapper.queryRoomOrderById(id);
        return roomOrder;
    }

    @Override
    public Integer modifyDate(RoomOrder roomOrder) {
        Integer i = orderMapper.modifyDate(roomOrder);
        return i;
    }

    @Override
    public List<RoomOrder> queryRoomOrderByUserId(Integer userId) {
        List<RoomOrder> roomOrderList = orderMapper.queryRoomOrderByUserId(userId);
        return roomOrderList;
    }

    @Override
    public List<FoodOrder> queryFoodOrderByUserId(Integer userId) {
        List<FoodOrder> foodOrderList = orderMapper.queryFoodOrderByUserId(userId);
        return foodOrderList;
    }

    @Override
    public Page queryPageRoomOrders(Integer currentPageNo) {
        Page page = new Page();
        Integer totalCounts = orderMapper.queryRoomTotalCounts();
        page.setTotalCount(totalCounts);

        //判断页面合理范围
        if(currentPageNo <= 1){
            currentPageNo = 1;
        }else if (currentPageNo > page.getPageCount()){
            currentPageNo = page.getPageCount();
        }

        page.setCurrentPage(currentPageNo);
        page.setUrl("order/queryPageRoomOrders");
        if (page.getTotalCount() == 0){
            return page;
        }
        List<RoomOrder> roomOrderList = orderMapper.queryPageRoomOrders((currentPageNo-1)*page.getPageSize(),page.getPageSize());
        page.setRoomOrderList(roomOrderList);
        return page;
    }

    @Override
    public Integer deleteRoomOrderById(Integer id) {
        Integer i = orderMapper.deleteRoomOrderById(id);
        return i;
    }

    @Override
    public Page queryPageFoodOrders(Integer currentPageNo) {
        Page page = new Page();
        Integer totalCounts = orderMapper.queryFoodTotalCounts();
        page.setTotalCount(totalCounts);

        //判断页面合理范围
        if(currentPageNo <= 1){
            currentPageNo = 1;
        }else if (currentPageNo > page.getPageCount()){
            currentPageNo = page.getPageCount();
        }

        page.setCurrentPage(currentPageNo);
        page.setUrl("order/queryPageFoodOrders");
        if (page.getTotalCount() == 0){
            return page;
        }
        List<FoodOrder> foodOrderList = orderMapper.queryPageFoodOrders((currentPageNo-1)*page.getPageSize(),page.getPageSize());
        page.setFoodOrderList(foodOrderList);
        return page;
    }

    @Override
    public Integer deleteFoodOrderById(Integer id) {
        Integer i= orderMapper.deleteFoodOrderById(id);
        return i;
    }

}
