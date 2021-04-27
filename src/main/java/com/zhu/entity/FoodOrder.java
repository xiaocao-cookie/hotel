package com.zhu.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FoodOrder {
    private Integer id;
    private Integer userId;
    private Integer fid;
    private Integer quantity;
    private Integer cost;

    private List<Food> foodList;
    private Food food;
    private User user;
}