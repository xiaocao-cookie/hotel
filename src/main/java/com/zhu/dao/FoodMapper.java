package com.zhu.dao;

import com.zhu.entity.Food;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FoodMapper {
    //查询所有食物
    public List<Food> getFoodList();
    //分页查询
    public List<Food> queryPageFoods(@Param("foodName") String foodName,
                                     @Param("minPrice") Integer minPrice,
                                     @Param("maxPrice") Integer maxPrice,
                                     @Param("stars") Integer stars,
                                     @Param("from") Integer from,
                                     @Param("pageSize") Integer pageSize);
    //查询记录总数
    public Integer queryTotalCount(@Param("foodName") String foodName,
                                   @Param("minPrice") Integer minPrice,
                                   @Param("maxPrice") Integer maxPrice,
                                   @Param("stars") Integer stars);
    //根据id删除菜品
    public Integer deleteFoodById(Integer id);
    //验证菜名是否重复
    public List<Food> verifyFoodName(String name);
    //添加菜品
    public Integer addFood(Food food);
    //根据id查询菜品信息
    public Food queryFoodById(Integer id);
    //修改菜品信息
    public Integer updateFood(Food food);
}
