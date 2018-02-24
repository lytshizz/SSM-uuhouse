package com.house.user.service.impl;

import java.util.Date;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.house.user.mapper.UserAuthsMapper;
import com.house.user.mapper.UserMapper;
import com.house.user.model.User;
import com.house.user.model.UserAuths;
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
	 * 日志记录
	 */
	public static Logger logger = Logger.getLogger(UserServiceImpl.class);
	
	/**
     *  因为没有在spring的文件中显式的声明userService实现类，直接通过getBean得到 userService 会找不到
     *  需要显式配置 @Service ("userService")，指定bean的名称
     *  相当与<bean id="userService" class="com.house.user.service.impl.UserServiceImpl"></bean>
     */
	@Resource
	private UserMapper userDao;
	
	@Resource
	private UserAuthsMapper userAuthsDao;
	
	public String[] checkLogin(String username, String password) {
		String[] resultArr = new String[2];
		String resultMsg = "";
		String resultId = "";
		System.out.println("用户名：" + username + ",密码：" + password);
		UserAuths userAuths = userAuthsDao.selectByIdentifier(username);
		System.out.println("用户信息为空：" + (userAuths == null));
		
		if(null == userAuths) {
			resultMsg = "notRegist";
		}
		else {
			String password1 = userAuths.getCredential();
			Byte status = userAuths.getStatus();
			if (!password.equals(password1)) {
				resultMsg = "loginError";
			} 
			else if(0 == status) {
				resultMsg = "notActive";
			}  
			else {
				userAuths.setLastLoginTime(new Date());
				userAuths.setLogin(userAuths.getLogin() + 1);
				updateByPrimaryKeySelective(userAuths);
				resultMsg = "loginSuccess";
				resultId = userAuths.getUid();
			}
		}
		resultArr[0] = resultMsg;
		resultArr[1] = resultId;
		return resultArr;
	}
	
	/*******************数据库user的增删改查***********************/
	public User getUserById(String uid) {
		return this.userDao.selectByPrimaryKey(uid);
	}
	
	public int deleteUserById(String uid) {
		return this.userDao.deleteByPrimaryKey(uid);
	}
	
	public int insertSelective(User user) {
		return this.userDao.insertSelective(user);
	}
	
	public int updateByPrimaryKeySelective(User user) {
		return this.userDao.updateByPrimaryKeySelective(user);
	}
	
	/*******************数据库userAuths的增删改查***********************/
	// 通过用户名查找用户
	public UserAuths getUserByIdentifier(String username) {
		return this.userAuthsDao.selectByIdentifier(username);
	}
		
	public int deleteUserAuthsById(String id) {
		return this.userAuthsDao.deleteByPrimaryKey(id);
	}
	
	public int insertSelective(UserAuths userAuths) {
		return this.userAuthsDao.insertSelective(userAuths);
	}
	
	public int updateByPrimaryKeySelective(UserAuths userAuths) {
		return this.userAuthsDao.updateByPrimaryKeySelective(userAuths);
	}
}
