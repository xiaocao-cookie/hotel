package com.zhu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chart")
public class ChartController {
    @RequestMapping("/member")
    public String chart1(){
        return "backend/member-chart";
    }
}
