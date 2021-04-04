package com.zhu.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
    private Integer id;
    private Integer nSendUid;
    private String content;
    private Integer nReceiveUid;
    private Date time;

    private String sendName;//发送者
    private String receiveName;//接收者
}
