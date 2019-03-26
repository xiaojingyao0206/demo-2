package com.example.demo.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.pojo.BankInfo;
import com.example.demo.service.BankInfoService;

@Controller
public class BankInfoController {

	@Resource
	BankInfoService service;
	
	@Resource
	BankInfo bankInfo;
	
	@RequestMapping("binding")
	public String binding(){
		
		return "binding";
	}
	
	@RequestMapping(value = "bank/binding", method = RequestMethod.POST)
	@ResponseBody
	public int register(String bankName,String bankActivation,String subBank,
			String bankCard,HttpServletRequest request){
		bankInfo.setBankActivation(bankActivation);
		bankInfo.setBankCard(bankCard);
		bankInfo.setBankName(bankName);
		bankInfo.setSubBank(subBank);
		HttpSession session=request.getSession();
		int userId = (int) session.getAttribute("userId");
		bankInfo.setUserId(userId);
		return service.insert(bankInfo);
		
	}
}
