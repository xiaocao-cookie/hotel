package com.zhu.dao;

public interface PriceMapper {
    //根据房屋类型id查询价格
    public Integer queryPriceByType(Integer ptid);
}
