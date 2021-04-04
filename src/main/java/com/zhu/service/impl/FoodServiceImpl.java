package com.zhu.service.impl;

import com.zhu.dao.FoodMapper;
import com.zhu.entity.Food;
import com.zhu.service.FoodService;
import com.zhu.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FoodServiceImpl implements FoodService {
    @Autowired
    public FoodMapper foodMapper;

    @Override
    public List<Food> getFoodList() {
        List<Food> foodList = foodMapper.getFoodList();
        return foodList;
    }

    @Override
    public Page queryPageFoods(Integer currentPage, Food food, Integer minPrice, Integer maxPrice) {
        Page page = new Page();
        Integer totalCount = foodMapper.queryTotalCount(food.getName(),minPrice,maxPrice,food.getStars());
        page.setTotalCount(totalCount);

        if (currentPage <= 1){
            currentPage = 1;
        }
        if (currentPage >= page.getTotalCount()){
            currentPage = page.getTotalCount();
        }
        page.setCurrentPage(currentPage);

        page.setUrl("/food/queryPageFoods");
        if (page.getTotalCount() == 0){
            return page;
        }
        List<Food> foodList = foodMapper.queryPageFoods(food.getName(),minPrice,maxPrice,food.getStars(),(currentPage-1)*page.getPageSize(),page.getPageSize());
        page.setFoodList(foodList);
        return page;
    }

    @Override
    public Integer deleteFoodById(Integer id) {
        Integer i = foodMapper.deleteFoodById(id);
        return i;
    }

    @Override
    public List<Food> verifyFoodName(String name) {
        List<Food> foodList = foodMapper.verifyFoodName(name);
        return foodList;
    }

    @Override
    public Integer addFood(Food food) {
        Integer i = foodMapper.addFood(food);
        return i;
    }
}
