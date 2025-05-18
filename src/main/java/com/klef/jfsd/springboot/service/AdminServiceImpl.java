package com.klef.jfsd.springboot.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Election;
import com.klef.jfsd.springboot.model.User;
import com.klef.jfsd.springboot.repository.AdminRepository;
import com.klef.jfsd.springboot.repository.ElectionRepository;
import com.klef.jfsd.springboot.repository.UserRepository;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	public AdminRepository adminRepository;
	
	@Autowired
	public UserRepository userRepository;
	
	@Autowired
	public ElectionRepository electionRepository;
	
	

	@Override
	public Admin checkadminlogin(String uname, String pwd) {
		return adminRepository.checkadminlogin(uname, pwd);

	}
    @Override
	public List<User> ViewAllUsers() {
	return userRepository.findAll();
	}
	@Override
	public String verifyUser(long id) {
		Optional<User> optionalUser = userRepository.findById(id);

	    if (optionalUser.isPresent()) {
	        User user = optionalUser.get();
	        user.setVerified(true);
	        userRepository.save(user);
	        
	        return "User verified successfully";
	    } else {
	        return "User not found. Please try again.";
	    }
	    
	}
	@Override
	public List<Election> getAllElections() {
	    return electionRepository.findAll();
	    
	    
	}
	@Override
	public String deleteUserById(Long id) {
		userRepository.deleteById(id);
	    return "User Deleted Successfully";
	}
}