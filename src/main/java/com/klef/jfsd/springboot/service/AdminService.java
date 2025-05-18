package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Election;
import com.klef.jfsd.springboot.model.User;

public interface AdminService {
	
	public Admin checkadminlogin(String uname, String pwd);
	public List<User> ViewAllUsers();
	public String verifyUser(long id);
	public List<Election> getAllElections();
	public String deleteUserById(Long id);
	

}