package com.example.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.pojo.BankInfo;


@Service
public interface BankInfoService {
	
	public List<BankInfo> selectByUserId(Integer userId);
    
    public Integer insert(BankInfo bankInfo);
    
    public Integer deleteByCardId(String bankCard);

}
