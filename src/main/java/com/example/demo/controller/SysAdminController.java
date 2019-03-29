package com.example.demo.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.example.demo.service.BankInfoService;
import com.example.demo.service.SysAdminService;

@Controller
public class SysAdminController {

	@Resource
	SysAdminService service;
}
