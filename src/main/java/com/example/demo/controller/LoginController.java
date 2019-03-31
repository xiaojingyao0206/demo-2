package com.example.demo.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.pojo.User;
import com.example.demo.pojo.UserInfo;
import com.example.demo.service.UserService;



@Controller
public class LoginController {

	@Resource
	UserService userService;
	
	@RequestMapping("/")
	public String index(Map<String,Object> model){
		
		return "index";
	}
	
	
	@RequestMapping("/login")
	public String login(){
		
		return "login";
	}
	
	@RequestMapping("/balance")
	public String balance(){
		
		return "balance";
	}
	
	
	@RequestMapping("/recharge")
	public String recharge(){
		
		return "recharge";
	}
	
	@RequestMapping("/withdraw")
	public String withdraw(){
		
		return "withdraw";
	}
	
	
	
	@RequestMapping("/test")
	public String test(){
		
		return "test";
	}
	
}
