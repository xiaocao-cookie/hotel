package com.zhu.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RoomOrder {
    private Integer id;
    private Integer orderId;
    private Integer rno;
    private Integer quantity;
    private Integer hireDate;
    private Integer cost;
}
