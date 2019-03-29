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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.pojo.User;
import com.example.demo.pojo.UserInfo;
import com.example.demo.service.UserService;

@Controller
public class UserController {

	@Resource
	UserService userService;
	
	@Resource 
	private UserInfo userInfo;
	
	
	@RequestMapping(value = "user/register", method = RequestMethod.POST)
	@ResponseBody
	public String register(String name,String password,String phone){
		userInfo.setUserName(name);
		userInfo.setEnterPw(password);
		userInfo.setUserPhone(phone);
		return userService.insert(userInfo);
		
	}

	@RequestMapping(value = "user/login", method = RequestMethod.POST)
	@ResponseBody
	public String login(String name,String password,HttpServletRequest request){			
		userInfo =  userService.selectByUserName(name);
		
		if(userInfo == null){
			return "2";
		}else{
			String realPassWord = userInfo.getEnterPw();
			
			if(!realPassWord.equals(password)){
				return "1";
			}else{
				HttpSession session=request.getSession();
				session.setAttribute("userName", name);
				session.setAttribute("userId", userInfo.getUserId());
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

	@RequestMapping("userRegister")
	public ModelAndView register(@RequestParam(value = "sysId", defaultValue = "null")String sysId){
		ModelAndView mav = new ModelAndView("register");
		mav.addObject("sysId", sysId);
		return mav;
	}
}
