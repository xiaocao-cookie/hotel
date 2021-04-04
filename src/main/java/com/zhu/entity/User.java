package com.zhu.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private Integer id;
    private String loginName;
    private String password;
    private Integer sex;
    private String idCard;
    private Integer type;
}
