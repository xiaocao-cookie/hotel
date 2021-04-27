package com.zhu.service.impl;

import com.zhu.dao.PriceMapper;
import com.zhu.service.PriceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PriceServiceImpl implements PriceService {

    @Autowired
    public PriceMapper priceMapper;

    @Override
    public Integer queryPriceByType(Integer ptid) {
        Integer price = priceMapper.queryPriceByType(ptid);
        return price;
    }
}
