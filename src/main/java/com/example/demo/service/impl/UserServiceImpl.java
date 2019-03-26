package com.example.demo.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.UserDao;
import com.example.demo.dao.UserInfoMapper;
import com.example.demo.pojo.User;
import com.example.demo.pojo.UserInfo;
import com.example.demo.service.UserService;


@Service("userService")
public class UserServiceImpl implements UserService{

	@Resource
	UserInfoMapper userInfoMapper;
	
	@Override
	public UserInfo selectByUserName(String name) {
		// TODO Auto-generated method stub
		return userInfoMapper.selectByUserName(name);
	}

	@Override
	public List<UserInfo> selectAll() {
		// TODO Auto-generated method stub
		return userInfoMapper.selectAll();
	}

	@Override
	public String insert(UserInfo userInfo) {
		String result="";
		String userName = userInfo.getUserName();
		Integer count = userInfoMapper.countByUserName(userName);
		if(count>0){
			result = "1";
		}else{
			userInfoMapper.insert(userInfo);			
			if(userInfo != null){
				result = "0";
			}else{
				result = "2";
			}
		}
		
		return result;
		
	}

}
