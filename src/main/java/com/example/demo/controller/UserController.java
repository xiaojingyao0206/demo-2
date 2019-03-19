package com.example.demo.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.pojo.User;
import com.example.demo.service.UserService;

@Controller
public class UserController {

	@Resource
	UserService userService;
	
	@Resource 
	private User user;
	
	
	@RequestMapping(value = "user/register", method = RequestMethod.POST)
	@ResponseBody
	public String register(String name,String password,String phone){
		user.setName(name);
		user.setPassword(password);
		user.setPhone(phone);
		return userService.insert(user);
		
	}

	@RequestMapping(value = "user/login", method = RequestMethod.POST)
	@ResponseBody
	public String login(String name,String password,HttpServletRequest request){			
		user =  userService.selectByUserName(name);
		
		if(user == null){
			return "2";
		}else{
			String realPassWord = user.getPassword();
			
			if(!realPassWord.equals(password)){
				return "1";
			}else{
				HttpSession session=request.getSession();
				session.setAttribute("userName", name);
				
				return "0";
			}
			
		}
		
	}
	
	@RequestMapping(value = "user/loginOut", method = RequestMethod.POST)
	@ResponseBody
	public String loginOut(HttpServletRequest request){
		HttpSession session=request.getSession();
		session.invalidate();
		return "0";		
	}

	
}
