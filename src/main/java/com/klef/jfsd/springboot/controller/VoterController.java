package com.klef.jfsd.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.klef.jfsd.springboot.model.Candidate;
import com.klef.jfsd.springboot.model.User;
import com.klef.jfsd.springboot.service.CandidateService;
import com.klef.jfsd.springboot.service.VoterService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller

public class VoterController {
	
	@Autowired
	public VoterService voterService;
	
	@Autowired
	public CandidateService candidateService;
	
	@PostMapping("/vote/cast")
	public String castVote(@RequestParam Long candidateId,
	                       @RequestParam Long codenum,
	                       HttpServletRequest request,
	                       RedirectAttributes redirectAttributes) {
	    HttpSession session = request.getSession();
	    User user = (User) session.getAttribute("user");

	    if (user == null) {
	        redirectAttributes.addFlashAttribute("error", "Please login first.");
	        return "redirect:/userLoginRegister";
	    }

	    Candidate candidate = candidateService.getCandidateById(candidateId);
	    if (candidate == null) {
	        redirectAttributes.addFlashAttribute("error", "Invalid candidate selected.");
	        return "redirect:/vote/" + codenum;
	    }

	    try {
	        voterService.castVote(user, candidate);
	        redirectAttributes.addFlashAttribute("success", "Your vote has been cast successfully.");
	    } catch (IllegalStateException e) {
	        redirectAttributes.addFlashAttribute("error", e.getMessage());
	    }

	    return "redirect:/vote/" + codenum;
	}
	


    
}