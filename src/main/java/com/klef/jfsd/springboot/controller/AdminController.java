package com.klef.jfsd.springboot.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Candidate;
import com.klef.jfsd.springboot.model.Election;
import com.klef.jfsd.springboot.model.User;
import com.klef.jfsd.springboot.service.AdminService;
import com.klef.jfsd.springboot.service.CandidateService;
import com.klef.jfsd.springboot.service.ElectionService;
import com.klef.jfsd.springboot.service.VoterService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class AdminController {
	
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private ElectionService electionService;
	
	 @Autowired
	    private CandidateService candidateService;
	 
	 @Autowired
	    private VoterService voterService;
	
	
	
	
	

	@GetMapping("/")
	public   ModelAndView home() 
	{
			 ModelAndView mv = new ModelAndView();
			mv.setViewName("index");
			 return mv;
	}
	

	@GetMapping("AdminLogin")
	public   ModelAndView adminlogin() 
	{
			 ModelAndView mv = new ModelAndView();
			mv.setViewName("AdminLogin");
			 return mv;
	}
	 @GetMapping("adminlogout")
		public ModelAndView  adminlogout()
		{
			ModelAndView mv = new ModelAndView();
			mv.setViewName("redirect:/");
			return mv;
		}
	@GetMapping("AdminDashboard")
	public   ModelAndView adminDashboard() 
	{
			 ModelAndView mv = new ModelAndView();
			mv.setViewName("AdminDashboard");
			 return mv;
	}
	
	@PostMapping("checkadminlogin")
	//@ResponseBody
	public ModelAndView checkadminlogin(HttpServletRequest request)
	{
			ModelAndView mv = new ModelAndView();
			
			String auname = request.getParameter("auname");
			String apwd = request.getParameter("apwd");
			
			Admin admin = adminService.checkadminlogin(auname, apwd);
			if(admin!=null)
			{
				
				mv.setViewName("redirect:/AdminDashboard");
			}		
			else
			{
				
				mv.setViewName("AdminLogin");
				mv.addObject("message","Login Failed");
			}
			  return mv;
	}
	
	@GetMapping("viewallusers")
	public ModelAndView viewallusers() {
		ModelAndView mv = new ModelAndView("viewallusers");
		List<User> userList = adminService.ViewAllUsers();
        mv.addObject("userlist", userList);
        return mv;
		
	}
 @GetMapping("verifyuser")
	public ModelAndView verifyUser(@RequestParam("id")  long id) {
		ModelAndView mv=new ModelAndView();
	    String msg=adminService.verifyUser(id);
	    mv.addObject("msg",msg);
	    mv.setViewName("redirect:/viewallusers");
	    return mv;
	}
 @GetMapping("/viewallelections")
 public ModelAndView viewAllElections() {
     ModelAndView mv = new ModelAndView("viewallelections"); // JSP page name
     List<Election> electionList = adminService.getAllElections();
     mv.addObject("electionList", electionList);
     return mv;
     
 }
 @GetMapping("/viewcandidatesfilter")
 public ModelAndView showCandidateFilterPage() {
     ModelAndView mv = new ModelAndView("viewcandidatesfilter");
     
     List<String> states = candidateService.getAllStates();
     System.out.println("Fetched states: " + states); // Add this debug
     mv.addObject("states", states);


     return mv;
 }

 // Handle the filter form submission
 @PostMapping("/displaycandidates")
 public ModelAndView filterCandidates(HttpServletRequest request) {
     String state = request.getParameter("state");
     String district = request.getParameter("district");

     List<Candidate> candidates = candidateService.getCandidatesByStateAndDistrict(state, district);

     ModelAndView mv = new ModelAndView("displaycandidates");
     mv.addObject("candidates", candidates);
     return mv;
 }
 @GetMapping("/candidate/displaypartyimage/{id}")
 public ResponseEntity<byte[]> displayPartyImage(@PathVariable Long id) throws Exception {
     Candidate candidate = candidateService.getCandidateById(id);

     if (candidate == null || candidate.getImage() == null) {
         return ResponseEntity.notFound().build();
     }

     byte[] imageBytes = candidate.getImage().getBytes(1, (int) candidate.getImage().length());

     return ResponseEntity.ok()
             .contentType(MediaType.IMAGE_JPEG)
             .body(imageBytes);
 }


 @GetMapping("/viewcandidatevotefilter")
 public ModelAndView showCandidatevotes() {
     ModelAndView mv = new ModelAndView("viewcandidatevotefilter");
     
     List<String> states = candidateService.getAllStates();
     System.out.println("Fetched states: " + states); // Add this debug
     mv.addObject("states", states);


     return mv;
 }

 @PostMapping("/displaycandidatevotes")
 public ModelAndView filtervoteCandidates(HttpServletRequest request) {
     String state = request.getParameter("state");
     String district = request.getParameter("district");
     List<Candidate> candidates = candidateService.getCandidatesByStateAndDistrict(state, district);
     
     // Get vote counts for all candidates
     Map<Long, Integer> voteCounts = voterService.getVoteCountsForAllCandidates();
     
     ModelAndView mv = new ModelAndView("displaycandidatevotes");
     mv.addObject("candidates", candidates);
     mv.addObject("voteCounts", voteCounts);
     return mv;
 }
 @GetMapping("/candidates/displaypartyimage/{id}")
 public ResponseEntity<byte[]> displayPartyImages(@PathVariable Long id) throws Exception {
     Candidate candidate = candidateService.getCandidateById(id);

     if (candidate == null || candidate.getImage() == null) {
         return ResponseEntity.notFound().build();
     }

     byte[] imageBytes = candidate.getImage().getBytes(1, (int) candidate.getImage().length());

     return ResponseEntity.ok()
             .contentType(MediaType.IMAGE_JPEG)
             .body(imageBytes);
 }



}