package com.house.user.service;

import com.house.user.model.User;

/**
 * 用户Service层接口
 * @author yst
 *
 */
public interface UserService {
	//根据id查找
	public User getUserById(String uid);
	
	//根据id删除
	public int deleteUserById(String uid);

	//添加一条数据
	public int insertSelective(User user);
	
	//修改一条数据
	public int updateByPrimaryKeySelective(User user);
}
