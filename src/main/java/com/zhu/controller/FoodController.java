package com.zhu.controller;

import com.zhu.entity.Food;
import com.zhu.service.FoodService;
import com.zhu.util.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/food")
public class FoodController {
    @Resource
    public FoodService foodService;
    //点击点餐按钮跳转
    @RequestMapping("/getFoodList")
    public String getFoodList(Model model){
        List<Food> foodList = foodService.getFoodList();
        model.addAttribute("foodList",foodList);
        return "pre/foodList";
    }
    //点击菜品查询详细信息
    @RequestMapping("/getFoodDetails")
    public String getFoodDetails(Model model){

        return "pre/foodDetail";
    }
    //分页查询
    @RequestMapping("/queryPageFoods")
    public String queryPageFoods(@RequestParam(value = "currentPage",defaultValue = "1") Integer currentPage,
                                 @RequestParam(value = "foodName",required = false) String foodName,
                                 @RequestParam(value = "minPrice",required = false) Integer minPrice,
                                 @RequestParam(value = "maxPrice",required = false) Integer maxPrice,
                                 @RequestParam(value = "stars",required = false) Integer stars,
                                 Model model){
        model.addAttribute("stars",stars);
        Food food = new Food();
        food.setName(foodName);
        food.setStars(stars);
        Page pager = foodService.queryPageFoods(currentPage,food,minPrice,maxPrice);
        List<Food> foodList = pager.getFoodList();
        model.addAttribute("foodList",foodList);
        model.addAttribute("pager",pager);
        return "backend/food-list";
    }
    //去添加
    @RequestMapping("/toAddFood")
    public String toAddFood(){
        return "backend/food-add";
    }

    //添加菜品
    @RequestMapping("/addFood")
    public void addFood(@RequestParam("foodName") String foodName,
                        @RequestParam("price") Integer price,
                        @RequestParam("stars") Integer stars,
                        HttpServletResponse response)throws Exception{
        PrintWriter out = response.getWriter();
        Food food = new Food();
        food.setName(foodName);
        food.setPrice(price);
        food.setStars(stars);
        Integer i = foodService.addFood(food);
        if (i > 0){
            out.println("{'status':'1','message':'添加成功'}");
        }else {
            out.println("{'status':'2','message':'添加失败'}");
        }
    }

    //删除菜品
    @RequestMapping("deleteFoodById")
    public void deleteFoodById(@RequestParam("id") Integer id,
                               HttpServletResponse response)throws Exception{
        PrintWriter out = response.getWriter();
        Integer i = foodService.deleteFoodById(id);
        if (i > 0){
            out.println("{'status':'1','message':'删除成功'}");
        }else{
            out.println("{'status':'2','message':'删除失败'}");
        }
    }

    //验证菜名是否重复
    @RequestMapping("/verifyFoodName")
    public void verifyFoodName(@RequestParam("foodName") String foodName,
                               HttpServletResponse response)throws Exception{
        PrintWriter out = response.getWriter();
        List<Food> foodList = foodService.verifyFoodName(foodName);
        if (foodList.size() != 0){
            out.println("{'status':'1'}");
        }else{
            out.println("{'status':'2'}");
        }
    }

}
