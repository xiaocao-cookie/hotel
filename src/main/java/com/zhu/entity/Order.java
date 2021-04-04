package com.zhu.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {
    private Integer id;
    private Integer uid;
    private String status;
    private Integer price;
    private Date startTime;
    private Date payTime;
}
