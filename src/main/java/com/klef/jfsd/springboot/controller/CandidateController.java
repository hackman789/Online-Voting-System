package com.klef.jfsd.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Candidate;
import com.klef.jfsd.springboot.model.Election;
import com.klef.jfsd.springboot.repository.ElectionRepository;
import com.klef.jfsd.springboot.service.CandidateService;

@Controller
public class CandidateController { 
	
	  @Autowired
	    private CandidateService candidateService;

	    @Autowired
	    private ElectionRepository electionRepository;

	    @GetMapping("/AddCandidate")
	    public ModelAndView showCandidateForm() {
	        ModelAndView mv = new ModelAndView("AddCandidate");
	        mv.addObject("elections", electionRepository.findAll());
	        return mv;
	    }

	    @PostMapping("/addcandidate")
	    public String addCandidate(
	        @RequestParam("candidateName") String name,
	        @RequestParam("party") String party,
	        @RequestParam("state") String state,
	        @RequestParam("district") String district,
	        @RequestParam("electionCodenum") Long codenum,
	        @RequestParam("image") MultipartFile imageFile
	    ) {
	        try {
	            Election election = electionRepository.findByCodenum(codenum);
	            if (election == null) {
	                return "redirect:/error";  // Handle invalid election
	            }

	            Candidate candidate = new Candidate();
	            candidate.setCandidateName(name);
	            candidate.setParty(party);
	            candidate.setState(state);
	            candidate.setDistrict(district);
	            candidate.setElection(election);
	            candidate.setImage(new javax.sql.rowset.serial.SerialBlob(imageFile.getBytes()));

	            candidateService.addCandidate(candidate);
	            return "redirect:/AddCandidate";

	        } catch (Exception e) {
	            e.printStackTrace();
	            return "redirect:/error";
	        }
	    }
	    
	    @GetMapping("/deleteCandidate")
	    public String deleteCandidates(@RequestParam("id") Long candidateId) {
	        candidateService.deleteCandidateByCandidateId(candidateId);
	        return "redirect:/viewcandidatesfilter";
	    }

}

