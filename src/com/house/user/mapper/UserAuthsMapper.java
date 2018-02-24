package com.house.user.mapper;

import com.house.user.model.UserAuths;

public interface UserAuthsMapper {
    int deleteByPrimaryKey(String id);

    int insert(UserAuths record);

    int insertSelective(UserAuths record);

    UserAuths selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(UserAuths record);

    int updateByPrimaryKey(UserAuths record);
}