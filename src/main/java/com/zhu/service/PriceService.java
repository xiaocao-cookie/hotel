package com.zhu.service;

import com.zhu.dao.PriceMapper;
import org.springframework.beans.factory.annotation.Autowired;

public interface PriceService {
    //根据房屋类型id查询价格
    public Integer queryPriceByType(Integer ptid);
}
