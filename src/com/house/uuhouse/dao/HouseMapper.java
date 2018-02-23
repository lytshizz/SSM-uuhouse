package com.house.uuhouse.dao;

import com.house.uuhouse.model.House;

public interface HouseMapper {
    int deleteByPrimaryKey(Integer hid);

    int insert(House record);

    int insertSelective(House record);

    House selectByPrimaryKey(Integer hid);

    int updateByPrimaryKeySelective(House record);

    int updateByPrimaryKey(House record);
}