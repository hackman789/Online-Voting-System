package com.klef.jfsd.springboot.repository;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.klef.jfsd.springboot.model.Candidate;
import com.klef.jfsd.springboot.model.Election;
import com.klef.jfsd.springboot.model.User;
import com.klef.jfsd.springboot.model.Vote;


public interface VoterRepository extends JpaRepository<Vote, Long> {
	 boolean existsByUserAndElection(User user, Election election);
	  long countByCandidateCandidateId(Long candidateId);
	  @Query("SELECT COUNT(v) FROM Vote v WHERE v.candidate.candidateId = :candidateId")
	    Integer countByCandidateId(Long candidateId);
	    
	    @Query("SELECT v.candidate.candidateId as candidateId, COUNT(v) as count FROM Vote v GROUP BY v.candidate.candidateId")
	    List<Object[]> countAllGroupByCandidateId();
}