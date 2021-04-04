package com.zhu.service.impl;

import com.zhu.dao.OrderMapper;
import com.zhu.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    public OrderMapper orderMapper;
}
