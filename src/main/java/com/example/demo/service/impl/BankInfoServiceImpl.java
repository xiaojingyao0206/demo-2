package com.example.demo.service.impl;

import java.util.List;
import java.util.Map;

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
			try {
				bankInfoMapper.insert(bankInfo);
				result = 0;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
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

	@Override
	public BankInfo selectBankInfo(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return bankInfoMapper.selectBankInfo(map);
	}

	@Override
	public String unBoundBankCard(Map<String, Object> map) {
		String ret="0";
		try {
			bankInfoMapper.unBoundBankCard(map);
		} catch (Exception e) {
			ret = "1";
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ret;			
	}

}
