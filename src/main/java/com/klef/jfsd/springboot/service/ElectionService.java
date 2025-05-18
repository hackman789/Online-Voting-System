package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Election;

public interface ElectionService {
	
	
	public String AddElection(Election election);
	public String deleteElectionByCodenum(Long codenum);
	public Election getElectionById(Long id);
	public Election findByCodenum(Long codenum);
	public void updateElection(Election election);
	public List<Election> findActiveElectionsByStateAndByDistrict(String state,String district);
	
	




	

}