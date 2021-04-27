package com.zhu.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RoomOrder {
    private Integer id;
    private Integer userId;
    private Integer rno;
    private Date startTime;
    private Date endTime;
    private Integer cost;

    private List<Room> roomList;
    private Room room;
    private User user;
}
