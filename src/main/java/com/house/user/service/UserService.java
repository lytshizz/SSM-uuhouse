package com.house.user.service;

import java.text.ParseException;

import com.house.user.model.User;
import com.house.user.model.UserAuths;

/**
 * 用户Service层接口
 * @author yst
 */
public interface UserService {
	// 检查登录时输入的登录名和密码
	public String[] checkLogin(String username, String password);
	
	// 根据用户名查找用户
	public boolean findByUserName(String username);
	
	// 根据验证码判断用户是否注册成功
	public String regist(UserAuths userAuths,String checkcode,
			String sessionCheckcode) throws ParseException ;
	
	/*******************数据库user的增删改查***********************/
	//根据id查找
	public User getUserById(String uid);
	
	//根据id删除
	public int deleteUserById(String uid);

	//添加一条User数据
	public int insertSelective(User user);
	
	//修改一条数据
	public int updateByPrimaryKeySelective(User user);
	
	/*******************数据库userAuths的增删改查***********************/
	public UserAuths getUserByIdentifier(String username);
	
	public int deleteUserAuthsById(String id);
	
	public int insertSelective(UserAuths userAuths);
	
	public int updateByPrimaryKeySelective(UserAuths userAuths);
}
