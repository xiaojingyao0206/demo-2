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
	UserInfoMapper userDao;
	
	@Override
	public UserInfo selectByUserName(String name) {
		// TODO Auto-generated method stub
		return userDao.selectByUserName(name);
	}

	@Override
	public List<UserInfo> selectAll() {
		// TODO Auto-generated method stub
		return userDao.selectAll();
	}

	@Override
	public String insert(UserInfo userInfo) {
		String result="";
		String userName = userInfo.getUserName();
		Integer count = userDao.countByUserName(userName);
		if(count>0){
			result = "1";
		}else{
			userDao.insert(userInfo);			
			if(userInfo != null){
				result = "2";
			}
		}
		
		return result;
		
	}

}
