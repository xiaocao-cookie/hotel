package com.zhu.controller;

import com.zhu.entity.*;
import com.zhu.service.*;
import com.zhu.util.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.jws.WebParam;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Resource
    public OrderService orderService;
    @Resource
    public RoomService roomService;
    @Resource
    public FoodService foodService;
    @Resource
    public PriceService priceService;
    @Resource
    public UserService userService;

    //我要入住 -- 去入住
    @RequestMapping("/toOrderRoom")
    public String toOrderRoom(@RequestParam("rno") Integer rno,Model model){
        Room room = roomService.queryRoomByRno(rno);
        Integer price = priceService.queryPriceByType(room.getRtype());
        model.addAttribute("room",room);
        model.addAttribute("price",price);
        return "pre/roomOrder";
    }

    //我要入住  -- 确定并支付
    @RequestMapping("/orderRoom")
    public void orderRoom(@RequestParam("id") Integer rno,
                          @RequestParam("userId") Integer userId,
                          @RequestParam("startTime") String startTime,
                          @RequestParam("endTime") String endTime,
                          @RequestParam("cost") Integer cost,
                          HttpServletResponse response)throws Exception{
        PrintWriter out = response.getWriter();
        RoomOrder roomOrder = new RoomOrder();
        roomOrder.setUserId(userId);
        roomOrder.setRno(rno);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = sdf.parse(startTime);
        roomOrder.setStartTime(startDate);
        Date endDate = sdf.parse(endTime);
        roomOrder.setEndTime(endDate);
        roomOrder.setCost(cost);
        //生成订单
        Integer i = orderService.orderRoom(roomOrder);
        if (i > 0){
            //在生成订单之后修改房态
            Integer j = roomService.updateRstatusById(rno);
            if (j > 0){
                out.println("{'status':'1','message':'预订成功'}");
            }else{
                out.println("{'status':'2','message':'预订失败'}");
            }
        }else{
            out.println("{'status':'2','message':'生成订单失败'}");
        }
    }

    //点餐 -- 去点餐
    @RequestMapping("/toOrderFood")
    public String toOrderFood(@RequestParam("id") Integer id,
                              Model model){
        Food food = foodService.queryFoodById(id);
        model.addAttribute("food",food);
        return "pre/foodOrder";
    }

    //点餐 -- 确定并支付
    @RequestMapping("/orderFood")
    public void orderFood(@RequestParam("userId") Integer userId,
                          @RequestParam("fid") Integer fid,
                          @RequestParam("quantity") Integer quantity,
                          @RequestParam("cost") Integer cost,
                          HttpServletResponse response)throws Exception{
        PrintWriter out = response.getWriter();
        FoodOrder foodOrder = new FoodOrder();
        foodOrder.setUserId(userId);
        foodOrder.setFid(fid);
        foodOrder.setQuantity(quantity);
        foodOrder.setCost(cost);
        Integer i = orderService.orderFood(foodOrder);
        if (i > 0){
            out.println("{'status':'1','message':'预订成功'}");
        }else{
            out.println("{'status':'2','message':'预订失败'}");
        }
    }

    //点击退租和续租前先判断此用户是否有房间订单
    @RequestMapping("/verifyRoomOrder")
    public void verifyRoomOrder(@RequestParam("id") Integer userId,
                                HttpServletResponse response)throws Exception{
        PrintWriter out = response.getWriter();
        List<RoomOrder> roomOrderList = orderService.queryRoomsByUserId(userId);
        if (roomOrderList == null || roomOrderList.size() == 0){
            out.println("{'status':'1','message':'系统查询到您还没有预订房间'}");
        }else{
            out.println("{'status':'2'}");
        }
    }

    //点击退租和续租之后查询的房间订单信息
    @RequestMapping("/queryRoomOrder")
    public String queryRoomOrder(@RequestParam("id") Integer userId,
                                 @RequestParam("menu") Integer menu,
                                 Model model){
        List<RoomOrder> roomOrderList = orderService.queryRoomsByUserId(userId);
        for (RoomOrder roomOrder : roomOrderList) {
            Room room = roomService.queryRoomByRno(roomOrder.getRno());
            roomOrder.setRoom(room);
        }
        model.addAttribute("roomOrderList",roomOrderList);
        model.addAttribute("menu",menu);
        return "pre/roomCancel";
    }

    //点击我要退租
    @RequestMapping("/cancelRoom")
    public void cancelRoom(@RequestParam("rno") Integer rno,
                           HttpServletResponse response)throws Exception{
        PrintWriter out = response.getWriter();
        Integer i = orderService.deleteRoomOrderByRno(rno);
        if (i > 0){
            //退租的时候将房间状态修改成未预订
            Integer j = roomService.modifyRstatusById(rno);
            if (j > 0){
                out.println("{'status':'1','message':'退租成功'}");
            }else{
                out.println("{'status':'2','message':'修改房态失败'}");
            }
        }else{
            out.println("{'status':'2','message':'退租失败'}");
        }
    }

    //我要续租-去续租
    @RequestMapping("/toRenewRoom")
    public String toRenewRoom(@RequestParam("id") Integer id,Model model){
        RoomOrder roomOrder = orderService.queryRoomOrderById(id);
        Room room = roomService.queryRoomByRno(roomOrder.getRno());
        Integer price = priceService.queryPriceByType(room.getRtype());
        model.addAttribute("roomOrder",roomOrder);
        model.addAttribute("room",room);
        model.addAttribute("price",price);
        return "pre/roomRenew";
    }

    //我要续租 -续租
    @RequestMapping("/renewRoom")
    public void renewRoom(@RequestParam("id") Integer id,
                          @RequestParam("startTime") String startTime,
                          @RequestParam("endTime") String endTime,
                          @RequestParam("cost") Integer cost,
                          HttpServletResponse response)throws Exception{
        PrintWriter out = response.getWriter();
        RoomOrder roomOrder = new RoomOrder();
        roomOrder.setId(id);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = sdf.parse(startTime);
        roomOrder.setStartTime(startDate);
        Date endDate = sdf.parse(endTime);
        roomOrder.setEndTime(endDate);
        roomOrder.setCost(cost);
        //根据订单id修改订单时间
        Integer i = orderService.modifyDate(roomOrder);
        if (i > 0){
            out.println("{'status':'1','message':'续租成功'}");
        }else{
            out.println("{'status':'2','message':'续租失败'}");
        }
    }

    //点击我的订单
    @RequestMapping("/queryMyOrder")
    public String queryMyOrder(@RequestParam("userId") Integer userId,
                               Model model){
        //房间订单信息
        List<RoomOrder> roomOrderList = orderService.queryRoomOrderByUserId(userId);
        for (RoomOrder roomOrder : roomOrderList) {
            Room room = roomService.queryRoomByRno(roomOrder.getRno());
            roomOrder.setRoom(room);
        }
        model.addAttribute("roomOrderList",roomOrderList);

        //菜品订单信息
        List<FoodOrder> foodOrderList = orderService.queryFoodOrderByUserId(userId);
        for (FoodOrder foodOrder : foodOrderList) {
            Food food = foodService.queryFoodById(foodOrder.getFid());
            foodOrder.setFood(food);
        }
        model.addAttribute("foodOrderList",foodOrderList);
        return "pre/personalOrder";
    }

    //后端管理页面 -- 点击房间订单列表
    @RequestMapping("/queryPageRoomOrders")
    public String queryPageRoomOrders(@RequestParam(value = "currentPage",defaultValue = "1") Integer currentPageNo,
                                        Model model){
        Page pager = orderService.queryPageRoomOrders(currentPageNo);
        List<RoomOrder> roomOrderList = pager.getRoomOrderList();
        for (RoomOrder roomOrder : roomOrderList) {
            Room room = roomService.queryRoomByRno(roomOrder.getRno());
            roomOrder.setRoom(room);
            User user = userService.queryUserById(roomOrder.getUserId());
            roomOrder.setUser(user);
        }
        model.addAttribute("pager",pager);
        model.addAttribute("roomOrderList",roomOrderList);
        return "backend/order/order-room-list";
    }

    //房间订单列表 -- 删除订单
    @RequestMapping("/deleteRoomOrderById")
    public void deleteRoomOrderById(@RequestParam("id") Integer id,
                                    HttpServletResponse response)throws Exception{
        PrintWriter out = response.getWriter();
        Integer i = orderService.deleteRoomOrderById(id);
        if (i > 0){
            out.println("{'status':'1','message':'删除成功'}");
        }else {
            out.println("{'status':'2','message':'删除失败'}");
        }
    }

    //后端管理页面 -- 点击菜品订单列表
    @RequestMapping("/queryPageFoodOrders")
    public String queryPageFoodOrders(@RequestParam(value = "currentPage",defaultValue = "1") Integer currentPageNo,
                                      Model model){
        Page pager = orderService.queryPageFoodOrders(currentPageNo);
        List<FoodOrder> foodOrderList = pager.getFoodOrderList();
        for (FoodOrder foodOrder : foodOrderList) {
            Food food = foodService.queryFoodById(foodOrder.getFid());
            foodOrder.setFood(food);
            User user = userService.queryUserById(foodOrder.getUserId());
            foodOrder.setUser(user);
        }
        model.addAttribute("pager",pager);
        model.addAttribute("foodOrderList",foodOrderList);
        return "backend/order/order-food-list";
    }

    //删除菜品订单
    @RequestMapping("/deleteFoodOrderById")
    public void deleteFoodOrderById(@RequestParam("id") Integer id,
                                    HttpServletResponse response)throws Exception{
        PrintWriter out = response.getWriter();
        Integer i = orderService.deleteFoodOrderById(id);
        if (i > 0){
            out.println("{'status':'1','message':'删除成功'}");
        }else {
            out.println("{'status':'2','message':'删除失败'}");
        }
    }
}
