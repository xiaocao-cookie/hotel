package com.zhu.service;

import com.zhu.entity.Food;
import com.zhu.util.Page;

import java.util.List;

public interface FoodService {
    //查询所有食物
    public List<Food> getFoodList();
    //分页查询
    public Page queryPageFoods(Integer currentPage,Food food,Integer minPrice,Integer maxPrice);
    //根据id删除菜品
    public Integer deleteFoodById(Integer id);
    //验证菜品是否重复
    public List<Food> verifyFoodName(String name);
    //添加菜品
    public Integer addFood(Food food);
    //根据id查询菜品信息
    public Food queryFoodById(Integer id);
    //修改菜品信息
    public Integer updateFood(Food food);
}
