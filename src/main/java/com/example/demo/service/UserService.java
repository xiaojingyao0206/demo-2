package com.example.demo.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.example.demo.pojo.User;

@Service
public interface UserService {
	
	public User selectByUserName(String name);
	 
    public List<User> selectAll();
    
    public String insert(User user);
    
    
}
