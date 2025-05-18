package com.klef.jfsd.springboot.controller;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Election;
import com.klef.jfsd.springboot.service.ElectionService;

@Controller
public class ElectionController {

    @Autowired
    private ElectionService electionService;

    // Handle election creation
    @PostMapping("/createElection")
    public String createElection(@RequestParam Long codenum,
    		                      @RequestParam String name,
                                 @RequestParam String state,
                                 @RequestParam(required = false) String district,
                                 @RequestParam LocalDate startDate,
                                 @RequestParam LocalDate endDate,
                                 @RequestParam (required = false) boolean active) {
        Election election = new Election();
        election.setCodenum(codenum);
        election.setName(name);
        election.setState(state);
        election.setDistrict(district); // District can be null if not provided
        election.setStartDate(startDate);
        election.setEndDate(endDate);
        election.setActive(active);

        // Save the election to the database
        electionService.AddElection(election);

        return "redirect:/viewallelections"; // Redirect to election list page or dashboard
    }
    
    @GetMapping("AddElection")
	public  ModelAndView AddElection() 
	{
			 ModelAndView mv = new ModelAndView();
			  mv.setViewName("AddElection");
			 return mv;
	}
    @GetMapping("/deleteElection")
    public String deleteElection(@RequestParam("id") Long codenum) {
        electionService.deleteElectionByCodenum(codenum);  // ✅ Use electionService if it's not adminService
        return "redirect:/viewallelections";
    }
    @GetMapping("/editElection")
    public ModelAndView showEditForm(@RequestParam("id") Long id) {
        Election election = electionService.getElectionById(id);
        ModelAndView mv = new ModelAndView("UpdateElection");
        mv.addObject("election", election);
        return mv;
    }

    @PostMapping("/updateElection")
    public String updateElection(@ModelAttribute Election election) {
        if (election.getCodenum() == null) {
            // Handle missing codenum here — redirect back with error or set default
            return "redirect:/Errorpage";
        }

        electionService.updateElection(election);
        return "redirect:/viewallelections";
    }



}