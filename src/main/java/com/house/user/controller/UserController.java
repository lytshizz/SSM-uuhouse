package com.house.user.controller;

import java.io.IOException;
import java.text.ParseException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.user.model.User;
import com.house.user.model.UserAuths;
import com.house.user.service.UserService;

@Controller
public class UserController {
	/**
	 * 日志记录
	 */
	public static Logger logger = Logger.getLogger(UserController.class);
	
	/**
     * 使用@Autowired也可以，@Autowired默认按类型装配
     * @Resource 默认按名称装配，当找不到与名称匹配的bean才会按类型装配。
     */
	@Resource
	private UserService userService;
	
	/*****************************************用户登录部分***************************************/
	/**
	 * 跳转到登录页面
	 */
	@RequestMapping("/user_login")
	public String loginPage() {
		return "login";
	}
	
	/**
	 * 跳转到房屋主页面
	 */
	@RequestMapping("/uu_index")
	public String indexPage(@RequestParam(value = "uid")String uid, Model model) {
		return "index";
	}
	
	/**
	 * 登录检查
	 */
	@RequestMapping("/user_checkLogin")
	@ResponseBody
	public String[] checkLogin(@RequestParam("username")String username, @RequestParam("password")String password, HttpSession httpSession) {
		String[] returnMsg = userService.checkLogin(username, password);
		System.out.println("返回提示信息：" + returnMsg[0] + ",返回用户uid：" + returnMsg[1]);
		if(!"".equals(returnMsg[1])) {
			User user = userService.getUserById(returnMsg[1]);
			httpSession.setAttribute("user", user);
		}
		return returnMsg;
	}

	/**
	 * 用户退出的方法
	 */
	@RequestMapping("/user_quit")
	public String quit(HttpSession httpSession) {
		httpSession.invalidate();
		return "index";
	}
	
	/*******************************************用户注册部分****************************************/
	/**
	 * 跳转到注册页面的执行方法
	 */
	@RequestMapping("user_toregist")
	public String registPage() {
		return "regist";
	}

	/**
	 * AJAX进行异步校验用户名的执行方法
	 */
	@RequestMapping("user_checkUserName")
	@ResponseBody
	public boolean checkUserName(@RequestParam("username")String username) {
		// 调用UserService进行查询:存在返回true
		System.out.println("用户名：" + username);
		boolean userNameExist = userService.findByUserName(username);
		return userNameExist;
	}
	
	/**
	 * 用户注册的方法:
	 * @throws IOException 
	 * @throws ParseException 
	 */
	@RequestMapping("user_regist")
	public String regist(UserAuths userAuths, @RequestParam("checkcode")String checkcode, 
			HttpServletRequest request, HttpSession httpSession) throws IOException, ParseException {
		// 判断验证码程序:
		// 从session中获得验证码的随机值:
		System.out.println("获取验证码：" + checkcode);
		String sessionCheckcode = (String) httpSession.getAttribute("checkCode");
		System.out.println("session中的code:" + sessionCheckcode);
		String msg = userService.regist(userAuths, checkcode, sessionCheckcode);
		if("registFailed".equals(msg)){
			request.setAttribute("registErrorMsg", "验证码输入错误!");
			return "regist";
		}
		else
		{
			httpSession.setAttribute("registMsg", "注册成功!请前往登录!");
			return "message";
		}
	}


}
