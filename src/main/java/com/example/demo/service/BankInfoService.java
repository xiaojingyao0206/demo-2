package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.pojo.BankInfo;


@Service
public interface BankInfoService {
	
	public List<BankInfo> selectByUserId(String userId);
    
    public int insert(BankInfo bankInfo);
    
    public int deleteByCardId(String bankCard);

}
