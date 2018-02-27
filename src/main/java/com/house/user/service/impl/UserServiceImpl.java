package com.house.user.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import com.house.utils.UUIDUtils;

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
	
	// 检查登录时输入的登录名和密码
	public String[] checkLogin(String username, String password) {
		String[] resultArr = new String[2];
		String resultMsg = "";
		String resultId = "";
		System.out.println("用户名：" + username + ",密码：" + password);
		UserAuths userAuths = userAuthsDao.selectByIdentifier(username);
		
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
	
	// 根据用户名查找用户
	public boolean findByUserName(String username) {
		UserAuths result = getUserByIdentifier(username);
		System.out.println("查询用户名结果：" + result);
		return  null != result;
	}
	
	// 根据验证码判断用户是否注册成功
	public String regist(UserAuths userAuths,String checkcode, String sessionCheckcode) throws ParseException {
		String msgResult = "registSuccess";
		if(!sessionCheckcode.equalsIgnoreCase(checkcode)){
			msgResult = "registFailed";
		}
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = "1000-01-01 00:00:00";
		Date startTime = format.parse(time);
		
		// 将信息保存到UserAuths表中
		String uid = UUIDUtils.getUUID();
		userAuths.setId(UUIDUtils.getUUID());
		userAuths.setUid(uid);
		userAuths.setIdentityType(userAuths.getIdentityType());
		userAuths.setIdentifier(userAuths.getIdentifier());
		userAuths.setCredential(userAuths.getCredential());
		userAuths.setUpdateTime(startTime);
		userAuths.setLastLoginTime(startTime);
		userAuths.setStatus((byte)1);
		userAuths.setRegTime(new Date());
		insertSelective(userAuths);
		
		// 保存到user表中
		User user = new User();
		user.setUid(uid);
		user.setNickname(userAuths.getIdentifier());
		insertSelective(user);
		
		return msgResult;
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
