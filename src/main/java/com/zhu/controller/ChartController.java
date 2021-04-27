package com.zhu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chart")
public class ChartController {
    @RequestMapping("/member")
    public String chart1(){
        return "backend/member/member-chart";
    }

    @RequestMapping("/weekChart")
    public String weekChart(){
        return "backend/order/week-echarts";
    }

    @RequestMapping("/monthChart")
    public String monthChart(){
        return "backend/order/month-echarts";
    }

}
