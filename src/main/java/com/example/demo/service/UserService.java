package com.example.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.example.demo.pojo.User;
import com.example.demo.pojo.UserInfo;

@Service
public interface UserService {
	
	public UserInfo selectByUserName(String name);
	 
    public List<UserInfo> selectAll();
    
    public String insert(UserInfo userInfo);
    
    
}
