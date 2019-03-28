package com.example.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.example.demo.pojo.BankInfo;


@Service
public interface BankInfoService {
	
	public List<BankInfo> selectByUserId(Integer userId);
    
    public Integer insert(BankInfo bankInfo);
    
    public Integer deleteByCardId(String bankCard);
    
    public BankInfo selectBankInfo(Map<String,Object> map);

	public String unBoundBankCard(Map<String, Object> map);

}
