package com.example.demo.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.demo.dao.BankInfoMapper;
import com.example.demo.dao.UserInfoMapper;
import com.example.demo.pojo.BankInfo;
import com.example.demo.service.BankInfoService;

@Service("bankInfoService")
public class BankInfoServiceImpl implements BankInfoService {

	@Resource
	BankInfoMapper bankInfoMapper;
	
	@Override
	public List<BankInfo> selectByUserId(Integer userId) {
		// TODO Auto-generated method stub
		return bankInfoMapper.selectByUserId(userId);
	}

	@Override
	public Integer insert(BankInfo bankInfo) {
		Integer result;
		String bankCard = bankInfo.getBankCard();
		Integer count = bankInfoMapper.countByBankCard(bankCard);
		if(count>0){
			result = 1;
		}else{
			bankInfoMapper.insert(bankInfo);			
			if(bankInfo != null){
				result = 0;
			}else{
				result = 2;
			}
		}
		
		return result;
	}

	@Override
	public Integer deleteByCardId(String bankCard) {
		// TODO Auto-generated method stub
		return 0;
	}

}
