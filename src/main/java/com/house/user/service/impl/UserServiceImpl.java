package com.house.user.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.house.user.mapper.UserMapper;
import com.house.user.model.User;
import com.house.user.service.UserService;

/**
 * UserService的实现类
 * @author yst
 *
 */
@Transactional
@Service("UserService")
public class UserServiceImpl implements UserService{
	/**
     *  因为没有在spring的文件中显式的声明userService实现类，直接通过getBean得到 userService 会找不到
     *  需要显式配置 @Service ("userService")，指定bean的名称
     *  相当与<bean id="userService" class="com.house.user.service.impl.UserServiceImpl"></bean>
     */
	@Resource
	private UserMapper userDao;
	
	public User getUserById(String uid) {
		System.out.println("用户id:" + uid);
		return this.userDao.selectByPrimaryKey(uid);
	}
	
	public int deleteUserById(String uid) {
		System.out.println("用户id:" + uid + "---");
		int num = -1;
		try {
			num = this.userDao.deleteByPrimaryKey(uid);
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		return num;
	}
	
	public int insertSelective(User user) {
		return this.userDao.insertSelective(user);
	}
	
	public int updateByPrimaryKeySelective(User user) {
		return this.userDao.updateByPrimaryKeySelective(user);
	}
}
