package com.example.demo.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.UserDao;
import com.example.demo.pojo.User;
import com.example.demo.service.UserService;


@Service("userService")
public class UserServiceImpl implements UserService{

	@Resource
	UserDao userDao;
	
	@Override
	public User selectByUserName(String name) {
		// TODO Auto-generated method stub
		return userDao.selectByUserName(name);
	}

	@Override
	public List<User> selectAll() {
		// TODO Auto-generated method stub
		return userDao.selectAll();
	}

	@Override
	public String insert(User user) {
		String result="";
		String userName = user.getName();
		Integer count = userDao.countByUserName(userName);
		if(count>0){
			result = "1";
		}else{
			userDao.insert(user);			
			if(user != null){
				result = "2";
			}
		}
		
		return result;
		
	}

}
