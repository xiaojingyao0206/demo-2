package com.example.demo.service;

import org.springframework.stereotype.Service;

import com.example.demo.pojo.SysAdmin;

@Service
public interface SysAdminService {

	public int deleteByPrimaryKey(Integer sysId);
	
	public int insert(SysAdmin record);
	
	public SysAdmin selectByPrimaryKey(Integer sysId);
}
