package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.User;
import com.klef.jfsd.springboot.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserRepository userRepository;

	@Override
	public String Register(User user) {
		userRepository.save(user);
		return "user Register Succesfully";
	}
	@Override
	public User checkLogin(String email, String password) {
			User user= userRepository.checkUserLogin(email, password);
			if(user==null)
				System.out.println("user not found");
			return user;
	}
	 @Override
	    public List<User> findByAdharnumber(String adharnumber) {
	        return userRepository.findByAdharnumber(adharnumber);
	    }
	  @Override
	    public User getUserById(Long id) {
	        return userRepository.findById(id).orElse(null); // or throw custom exception if needed
	    }
	 
	

}
