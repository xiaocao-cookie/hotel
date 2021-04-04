package com.zhu.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FoodOrder {
    private Integer id;
    private Integer orderId;
    private Integer fid;
    private Integer quantity;
    private Integer cost;
}