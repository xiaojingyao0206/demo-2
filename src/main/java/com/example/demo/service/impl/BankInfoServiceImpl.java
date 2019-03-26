package com.example.demo.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.demo.pojo.BankInfo;
import com.example.demo.service.BankInfoService;

@Service("bankInfoService")
public class BankInfoServiceImpl implements BankInfoService {

	@Resource
	BankInfo bankInfo;
	
	@Override
	public List<BankInfo> selectByUserId(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(BankInfo bankInfo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteByCardId(String bankCard) {
		// TODO Auto-generated method stub
		return 0;
	}

}
