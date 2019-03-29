package com.example.demo.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.demo.dao.SysAdminMapper;
import com.example.demo.pojo.SysAdmin;
import com.example.demo.service.SysAdminService;

@Service("sysAdminService")
public class SysAdminServiceImpl implements SysAdminService{

	@Resource
	SysAdminMapper sysAdminMapper;
	
	@Override
	public int deleteByPrimaryKey(Integer sysId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(SysAdmin record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public SysAdmin selectByPrimaryKey(Integer sysId) {
		// TODO Auto-generated method stub
		return null;
	}

}
