package com.klef.jfsd.springboot.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Candidate;

import jakarta.transaction.Transactional;

@Repository
public interface CandidateRepository  extends JpaRepository<Candidate, Long> {
	
	public List<Candidate> findByElectionCodenum(Long codenum);
	List<Candidate> findByStateAndDistrict(String state, String district);
    @Query("SELECT DISTINCT c.state FROM Candidate c")
    List<String> findDistinctStates();
   public  Optional<Candidate> findById(Long candidateId);
   

   @Query("delete from Candidate c where c.candidateId=?1")
   @Modifying
   @Transactional
   public int deleteByCandidateId(Long candidateId);
   
   List<Candidate> findByElectionCodenumAndStateAndDistrict(Long codenum, String state, String district);


}