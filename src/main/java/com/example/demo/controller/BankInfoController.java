package com.example.demo.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	public Integer register(String bankName,String bankActivation,String subBank,
			String bankCard,HttpServletRequest request){
		Integer ret;
		bankInfo.setBankActivation(bankActivation);
		bankInfo.setBankCard(bankCard);
		bankInfo.setBankName(bankName);
		bankInfo.setSubBank(subBank);
		HttpSession session=request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		bankInfo.setUserId(userId);
		
		try {
			ret = service.insert(bankInfo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ret = 2;
		}
		return ret;
	}
	
	@RequestMapping("/cardList")
	public ModelAndView  cardList(HttpServletRequest request) {
		HttpSession session=request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		List<BankInfo> list = service.selectByUserId(userId);
		ModelAndView mav = new ModelAndView("bankCard");
		mav.addObject("list", list);
		return mav;
	}


}
