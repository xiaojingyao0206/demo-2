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
	
	@RequestMapping("/index")
	public String index(Map<String,Object> model){
		model.put("time", new Date());
		model.put("message", "hello");
		return "index";
	}
	
	@RequestMapping("/register")
	public String register(){
		
		return "register";
	}
	
	@RequestMapping("/login")
	public String login(){
		
		return "login";
	}
	
	@RequestMapping("/balance")
	public String balance(){
		
		return "balance";
	}
	
	@RequestMapping("/userInfo")
	public String userInfo(){
		
		return "userInfo";
	}
	
	@RequestMapping("/recharge")
	public String recharge(){
		
		return "recharge";
	}
	
	@RequestMapping("/withdraw")
	public String withdraw(){
		
		return "withdraw";
	}
	
	
	@RequestMapping("/resetPassword")
	public String resetPassword(){
		
		return "resetPassword";
	}
	
	@RequestMapping("/qrcode")
	public String qrcode(){
		
		return "qrcode";
	}
	
	@RequestMapping("/test")
	public String test(){
		
		return "test";
	}
	
	@RequestMapping(value = "/users", method = RequestMethod.GET)
	@ResponseBody
    public List<UserInfo> getAll() {
        return userService.selectAll();
	}
}
