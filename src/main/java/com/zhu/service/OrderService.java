package com.zhu.service;

import com.zhu.entity.FoodOrder;
import com.zhu.entity.RoomOrder;
import com.zhu.util.Page;

import java.util.List;

public interface OrderService {
    //生成房间订单
    public Integer orderRoom(RoomOrder roomOrder);
    //生成菜品订单
    public Integer orderFood(FoodOrder foodOrder);
    //通过userId查询订单信息
    public List<RoomOrder> queryRoomsByUserId(Integer userId);
    //退房，根据房号删除订单
    public Integer deleteRoomOrderByRno(Integer rno);
    //通过id查询订单信息
    public RoomOrder queryRoomOrderById(Integer id);
    //根据订单id修改订单时间 -- 续租
    public Integer modifyDate(RoomOrder roomOrder);
    //通过userId查询房间订单信息
    public List<RoomOrder> queryRoomOrderByUserId(Integer userId);
    //通过userId查询菜品订单信息
    public List<FoodOrder> queryFoodOrderByUserId(Integer userId);
    //分页查询 -- 房间
    public Page queryPageRoomOrders(Integer currentPageNo);
    //通过id删除房间订单
    public Integer deleteRoomOrderById(Integer id);
    //分页查询 -- 菜品
    public Page queryPageFoodOrders(Integer currentPageNo);
    //通过id删除菜品订单
    public Integer deleteFoodOrderById(Integer id);
}
