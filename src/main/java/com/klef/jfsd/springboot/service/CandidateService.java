package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Candidate;

public interface CandidateService {
	
	public  String addCandidate(Candidate candidate);

	   public List<Candidate> getCandidatesByStateAndDistrict(String state, String district);
	   public List<String> getAllStates(); // optional helper for dropdowns
	   public Candidate getCandidateById(Long id);
	   public String deleteCandidateByCandidateId(Long candidateId);
	   List<Candidate> getCandidatesByElectionCodeStateDistrict(Long codenum, String state, String district);

}