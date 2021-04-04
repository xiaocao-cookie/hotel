package com.zhu.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Room {
    private Integer rno;
    private String rname;
    private Integer rtype;
    private String status;
    private String rstyle;
    private String picPath;
    private Integer rfloor;

    //价格表
    private Integer price;
}
