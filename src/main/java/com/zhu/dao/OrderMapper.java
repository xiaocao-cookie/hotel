package com.zhu.dao;

import com.zhu.entity.Order;

public interface OrderMapper {
    //点击订餐生成待支付订单
    public Integer orderFoods(Order order);
}
