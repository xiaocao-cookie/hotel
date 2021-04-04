package com.zhu.controller;

import com.zhu.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Resource
    public OrderService orderService;
}
