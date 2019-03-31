package com.example.demo.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.pojo.SysAdmin;
import com.example.demo.service.BankInfoService;
import com.example.demo.service.SysAdminService;

@Controller
public class SysAdminController {

	@Resource
	SysAdminService service;
	
	@RequestMapping(value = "sysAdmin/register", method = RequestMethod.POST)
	@ResponseBody
	public Integer register(String name,String password,String email,String phone){
		SysAdmin info = new SysAdmin();
		info.setSysName(name);
		info.setSysMail(email);
		info.setSysPhone(phone);
		info.setSysPwd(password);
		info.setSysStatus("1");
		return service.insert(info);
		
	}
	
	@RequestMapping(value = "sysAdmin/login", method = RequestMethod.POST)
	@ResponseBody
	public String login(String name,String password,HttpServletRequest request){			
		SysAdmin info =  service.selectBySysName(name);
		
		if(info == null){
			return "2";
		}else{
			String realPassWord = info.getSysPwd();
			
			if(!realPassWord.equals(password)){
				return "1";
			}else{
				HttpSession session=request.getSession();
				session.setAttribute("sysName", name);
				session.setAttribute("sysId", info.getSysId());
				return "0";
			}
			
		}
		
	}
	@RequestMapping(value = "sysAdmin/loginOut", method = RequestMethod.POST)
	@ResponseBody
	public String loginOut(HttpServletRequest request){
		HttpSession session=request.getSession();
		session.invalidate();
		return "0";		
	}
	
	//系统管理员注册
	@RequestMapping("sysRegister")
	public ModelAndView register(){
		ModelAndView mav = new ModelAndView("sysReg");	
		return mav;
	}
	
	//二维码
	@RequestMapping("/qrcode")
	public String qrcode(){		
		return "qrcode";
	}
	
	@RequestMapping("/syslogin")
	public String syslogin(){		
		return "syslogin";
	}
	
	@RequestMapping("/sysManage")
	public String sysManage(){		
		return "sysManage";
	}
}
