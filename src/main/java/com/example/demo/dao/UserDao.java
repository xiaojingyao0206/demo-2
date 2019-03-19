package com.example.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.example.demo.pojo.User;

@Repository
public interface UserDao {

	public User selectByUserName(String name);
	
	public List<User> selectAll();
	
	public void insert(User user);
	
	public int countByUserName(String name);
}
