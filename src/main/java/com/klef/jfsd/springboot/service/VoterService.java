package com.klef.jfsd.springboot.service;




import java.util.List;
import java.util.Map;

import com.klef.jfsd.springboot.model.Candidate;
import com.klef.jfsd.springboot.model.Election;
import com.klef.jfsd.springboot.model.User;


public interface VoterService {
	 boolean hasUserVoted(User user, Election election);
	    void castVote(User user, Candidate candidate);
	    Map<Long, Integer> getVoteCountsForAllCandidates();
	    Integer getVoteCountForCandidate(Long candidateId);
}