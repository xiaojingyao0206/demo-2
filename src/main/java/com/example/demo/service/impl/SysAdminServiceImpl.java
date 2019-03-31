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
	public Integer deleteByPrimaryKey(Integer sysId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Integer insert(SysAdmin record) {
		Integer result;
		String sysName = record.getSysName();
		Integer count = sysAdminMapper.countByName(sysName);
		if(count>0){
			result = 1;
		}else{
			try {
				sysAdminMapper.insert(record);
				result = 0;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				result = 2;
				e.printStackTrace();
			}			
		}
		
		return result;
	}

	@Override
	public SysAdmin selectByPrimaryKey(Integer sysId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SysAdmin selectBySysName(String sysName) {
		// TODO Auto-generated method stub
		return sysAdminMapper.selectBySysName(sysName);
	}

	
}
