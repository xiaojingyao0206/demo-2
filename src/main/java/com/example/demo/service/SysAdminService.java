package com.example.demo.service;

import org.springframework.stereotype.Service;

import com.example.demo.pojo.SysAdmin;

@Service
public interface SysAdminService {

	public Integer deleteByPrimaryKey(Integer sysId);
	
	public Integer insert(SysAdmin record);
	
	public SysAdmin selectByPrimaryKey(Integer sysId);

	public SysAdmin selectBySysName(String name);
	
	
}
