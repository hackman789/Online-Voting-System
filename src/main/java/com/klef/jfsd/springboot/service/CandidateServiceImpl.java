package com.klef.jfsd.springboot.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Candidate;
import com.klef.jfsd.springboot.repository.CandidateRepository;
import com.klef.jfsd.springboot.repository.ElectionRepository;

import jakarta.transaction.Transactional;

@Service
public class CandidateServiceImpl implements CandidateService{
	

    @Autowired
    private CandidateRepository candidateRepository;

    @Autowired
    private ElectionRepository electionRepository;

    @Override
    public String addCandidate(Candidate candidate) {
        candidateRepository.save(candidate);
        return "Candidate Added Successfully";
    }

    @Override
    public List<Candidate> getCandidatesByStateAndDistrict(String state, String district) {
        return candidateRepository.findByStateAndDistrict(state, district);
    }

    @Override
    public List<String> getAllStates() {
        return candidateRepository.findDistinctStates();
    }
    @Override
    public Candidate getCandidateById(Long candidateId) {
        // Retrieve the candidate by ID from the repository
        Optional<Candidate> candidate = candidateRepository.findById(candidateId);
        return candidate.orElse(null);  // If candidate is not found, return null
    }
    @Transactional
    @Override
    public String deleteCandidateByCandidateId(Long candidateId) {
        candidateRepository.deleteByCandidateId(candidateId);
        return "Election Deleted Successfully";
    }
    @Override
    public List<Candidate> getCandidatesByElectionCodeStateDistrict(Long electionId, String state, String district) {
        return candidateRepository.findByElectionCodenumAndStateAndDistrict(electionId, state, district);
}

    
    
}
	

