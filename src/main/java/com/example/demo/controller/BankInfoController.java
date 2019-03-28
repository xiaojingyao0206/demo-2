package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;
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
	public ModelAndView  cardList(@RequestParam(value = "type", defaultValue = "null")String type ,HttpServletRequest request) {
		HttpSession session=request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		List<BankInfo> list = service.selectByUserId(userId);
		ModelAndView mav = new ModelAndView("bankCard");
		mav.addObject("list", list);
		mav.addObject("type", type);
		return mav;
	}

	@RequestMapping(value="/bankInfo", method = RequestMethod.GET)
	public ModelAndView bankInfo(@RequestParam(value = "bankCard", defaultValue = "null") String bankCard,HttpServletRequest request) {
		HttpSession session=request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("bankCard", bankCard);
		
		BankInfo bankInfo = service.selectBankInfo(map);
		ModelAndView mav = new ModelAndView("bankInfo");
		mav.addObject("bankInfo", bankInfo);
		return mav;
	}
	
	@RequestMapping(value = "bank/getBankInfo", method = RequestMethod.GET)
	@ResponseBody
	public BankInfo getBankInfo(@RequestParam(value = "bankCard", defaultValue = "null") String bankCard,HttpServletRequest request){
		
		HttpSession session=request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("bankCard", bankCard);
		
		BankInfo bankInfo = service.selectBankInfo(map);
		return bankInfo;
		
	}

	@RequestMapping(value = "bank/unbound", method = RequestMethod.POST)
	@ResponseBody
	public String unbound(String bankCard,HttpServletRequest request){
		HttpSession session=request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("bankCard", bankCard);
		
		return service.unBoundBankCard(map);
		
	}
	
}
