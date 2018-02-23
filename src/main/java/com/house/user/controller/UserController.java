package com.house.user.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.house.user.model.User;
import com.house.user.service.UserService;

@Controller
public class UserController {
	/**
     * 使用@Autowired也可以，@Autowired默认按类型装配
     * @Resource 默认按名称装配，当找不到与名称匹配的bean才会按类型装配。
     */
	@Resource
	private UserService userService;

	/**
	 * 测试查询
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/showUser")
	public String testShowUser(@RequestParam(value = "id")String id, Model model) {
		System.out.println("id:" + id);
		User user = userService.getUserById(id);
		System.out.println("用户生日：" + user.getBirthday());
		model.addAttribute("user", user);
		return "showUser";
	}
	
	/**
	 * 测试删除
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/deleteUser")
	public void testDeleteUser(@RequestParam(value = "id")String id) {
		System.out.println("id:" + id);
		int num = -1;
		try {
			num = userService.deleteUserById(id);
			System.out.println("删除行数：" + num);
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}
	
	/**
	 * 测试插入数据
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping("/insertUser")
	public String testInsertUser(Model model) throws ParseException {
		User user = new User();
		user.setUid("5");
		user.setNickname("笑颜如花");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date date = format.parse("1994-05-23 00:00:01");
		Timestamp tsp = new Timestamp(date.getTime());
		user.setBirthday(tsp);
		user.setSex((byte)1); 
		model.addAttribute("user", user);
		int count = userService.insertSelective(user);
		System.out.println("插入" + count + "条用户成功");
		return "showUser";
	}
	
	/**
	 * 测试插入数据
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping("/updateUser")
	public String testUpdateUser(Model model) throws ParseException {
		User user = new User();
		user.setUid("2");
		user.setNickname("笑颜如花");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date date = format.parse("1994-05-23 00:10:01");
		Timestamp tsp = new Timestamp(date.getTime());
		user.setBirthday(tsp);
		user.setSex((byte)1); 
		model.addAttribute("user", user);
		int count = userService.updateByPrimaryKeySelective(user);
		System.out.println("修改" + count + "条用户成功");
		return "showUser";
	}
}
