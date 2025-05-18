package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.User;

public interface UserService {
	
	public String Register(User user);
	public User checkLogin(String email, String password);
	 public List<User> findByAdharnumber(String adharnumber);
	public User getUserById(Long userId);
	 
	

}
