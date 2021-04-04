package com.zhu.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Food {
    private Integer id;
    private String name;
    private Integer price;
    private String picPath;
    private Integer stars;
}
