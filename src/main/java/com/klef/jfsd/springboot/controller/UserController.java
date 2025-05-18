package com.klef.jfsd.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Candidate;
import com.klef.jfsd.springboot.model.Election;
import com.klef.jfsd.springboot.model.User;
import com.klef.jfsd.springboot.service.AdminService;
import com.klef.jfsd.springboot.service.AdminService;
import com.klef.jfsd.springboot.service.CandidateService;
import com.klef.jfsd.springboot.service.ElectionService;
import com.klef.jfsd.springboot.service.UserService;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	 @Autowired
	 private JavaMailSender mailSender;
	
	@Autowired
	private ElectionService electionService;
	
	@Autowired
	private CandidateService candidateService;
	
	
	
	@Autowired
	private AdminService adminService;
	
	@GetMapping("userLoginRegister")
	public  ModelAndView studentLoginRegister() 
	{
			 ModelAndView mv = new ModelAndView();
			  mv.setViewName("userLoginRegister");
			 return mv;
	}
	    @GetMapping("about")
	   public  ModelAndView  aboout() 
	{
			 ModelAndView mv = new ModelAndView();
			  mv.setViewName("about");
			 return mv;
	}
	 @GetMapping("userlogout")
		public ModelAndView  userlogout()
		{
			ModelAndView mv = new ModelAndView();
			mv.setViewName("redirect:/userLoginRegister");
			return mv;
		}
	 @GetMapping("usersessionexpiry") 
	  public ModelAndView empsessionexpiry() 
	  { 
	   ModelAndView mv = new ModelAndView(); 
	   mv.setViewName("usersessionexpiry"); 
	   return mv;
	  }
	@GetMapping("LoginFail")
	public  ModelAndView LoginFail() 
	{
			 ModelAndView mv = new ModelAndView();
			  mv.setViewName("Errorpage");
			 return mv;
	}
	@PostMapping("/insertuser")
	public ModelAndView insertuser(HttpServletRequest request) throws Exception {
	    // Retrieve user data from the form
	    String fullName = request.getParameter("fullname");
	    String gender = request.getParameter("gender");
	    String dateOfBirth = request.getParameter("dateofbirth");
	    String email = request.getParameter("email");
	    String mobileNumber = request.getParameter("mobilenumber");
	    String city = request.getParameter("city");
	    String state = request.getParameter("state");
	    String district = request.getParameter("district");
	    String pincode = request.getParameter("pincode");
	    String country = request.getParameter("country");
	    String password = request.getParameter("password");
	    String adharnumber = request.getParameter("adharnumber");

	    // Create a new User object and set its attributes
	    User user = new User();
	    user.setFullName(fullName);
	    user.setGender(gender);
	    user.setDateOfBirth(dateOfBirth);
	    user.setEmail(email);
	    user.setMobileNumber(mobileNumber);
	    user.setCity(city);
	    user.setState(state);
	    user.setDistrict(district);
	    user.setPincode(pincode);
	    user.setCountry(country);
	    user.setPassword(password);
	    user.setAdharnumber(adharnumber);

	    // Verification logic based on Aadhaar number (example logic)
	    List<User> usersWithSameAadhar = userService.findByAdharnumber(adharnumber);
	    if (usersWithSameAadhar != null && !usersWithSameAadhar.isEmpty()) {
	        System.out.println("Aadhaar number already registered");
	        user.setVerified(true);
	    } else {
	        user.setVerified(false);
	    }

	    userService.Register(user);
	    
	    sendRegistrationEmail(email, fullName);
	    

	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("redirect:/userLoginRegister");
	    mv.addObject("message", "Registration successful! A confirmation email has been sent to your address.");
	    return mv;
	}
	@PostMapping("/checkuserlogin")
	public ModelAndView checkUserLogin(HttpServletRequest request) {
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");
	    ModelAndView mv = new ModelAndView();

	    System.out.println(email + " " + password);

	    User user = userService.checkLogin(email, password);

	     if (user == null) {
	        HttpSession session = request.getSession();
	        session.setAttribute("error", "Check your credentials");
	        System.out.println("Details not found");
	        mv.setViewName("redirect:/UserLoginRegister"); 
	    } else if (!user.isVerified()) {
	        mv.addObject("msg", "Your account is not verified. Kindly contact Admin (in Contact page)");
	        mv.setViewName("Errorpage");
	        System.out.println(user.toString()+"");
	    } else {
	        HttpSession session = request.getSession();
	        session.setAttribute("user", user);
	        mv.setViewName("redirect:/userDashboard");
	        System.out.println(user.toString());
	    }
	    return mv;
	}
	 @GetMapping("/deleteUser")
	    public String deleteUser(@RequestParam("id") Long id) {
	        adminService.deleteUserById(id);  // ✅ Use electionService if it's not adminService
	        return "redirect:/viewallusers";
	    }
	@GetMapping("/userDashboard")
	public ModelAndView userDashboard(HttpSession session) {
	    User user = (User) session.getAttribute("user");
	    if (user == null) {
	        return new ModelAndView("redirect:/usersessionexpiry");
	    }

	    ModelAndView mv = new ModelAndView("userDashboard");
	    mv.addObject("user", user);

	    // Add elections list
	    List<Election> electionList = adminService.getAllElections();
	    mv.addObject("electionList", electionList);

	    return mv;
	}

	@GetMapping("/ActiveElection")
	public ModelAndView ActiveElection(HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView();

	    // Retrieve user from session
	    HttpSession session = request.getSession();
	    User user = (User) session.getAttribute("user");

	    if (user == null) {
	        mv.setViewName("Errorpage");
	        return mv;
	    }

	    Long id = user.getId();  // Retrieve the user id from session
	    String userState = user.getState().trim();
	    String userDistrict = user.getDistrict().trim();
	    System.out.println("User state: " + userState);  
	    System.out.println("User district: " + userDistrict);// Log the state

	    // Fetch active elections for the user's state
	    List<Election> elections = electionService.findActiveElectionsByStateAndByDistrict(userState,userDistrict);
	    System.out.println("Found elections: " + elections.size());  // Log number of elections found

	    // Handle the result
	    mv.addObject("activeElections", elections);  // Ensure the attribute name matches with the JSP reference
	    mv.addObject("user", user);
	    mv.setViewName("ActiveElection");

	    return mv;
	}
	
	
	@GetMapping("/vote/{codenum}")
	public ModelAndView showCandidates(@PathVariable Long codenum, HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView();
	    HttpSession session = request.getSession();
	    User user = (User) session.getAttribute("user");

	    if (user == null) {
	        mv.setViewName("redirect:/userLoginRegister");
	        request.getSession().setAttribute("error", "Please login first.");
	        return mv;
	    }
	    String userState = user.getState().trim();
	    String userDistrict = user.getDistrict().trim();

	    List<Candidate> candidates = candidateService.getCandidatesByElectionCodeStateDistrict(
	        codenum, userState, userDistrict
	    );

	    mv.addObject("candidates", candidates);
	    mv.addObject("codenum", codenum);
	    mv.setViewName("voter");

	    return mv;
	}
	 
	private void sendRegistrationEmail(String email, String fullName) throws Exception {
	    // Create a MimeMessage for the email
	    MimeMessage mimeMessage = mailSender.createMimeMessage();
	    MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);

	  
	    String subject = "Welcome to OnlineVoting Hub!";
	    String htmlContent = 
	        "<h3>Welcome to OnlineVotingPlatform!</h3>" +
	        "<p>Dear <strong>" + fullName + "</strong>,</p>" +
	        "<p>Thank you for registering with <strong>Online Voting Hub</strong>. We're excited to have you on board!</p>" +
	        "<p>If you have any questions or need assistance, feel free to reach out to us.</p>" +
	        "<p>Thank you,<br>The Voting hub Team</p>";

	    // Set email details
	    helper.setTo(email);
	    helper.setSubject(subject);
	    helper.setFrom("karimmm0112@gmail.com");
	    helper.setText(htmlContent, true);

	    // Send the email
	    mailSender.send(mimeMessage);
	}
	@GetMapping("/userprofile")
	public ModelAndView userProfile(HttpSession session) {
	    User user = (User) session.getAttribute("user");
	    ModelAndView mv = new ModelAndView();
	    
	    if (user == null) {
	        mv.setViewName("redirect:/userLoginRegister");
	        return mv;
	    }

	    // Add user details to the model to be displayed on the profile page
	    mv.addObject("user", user);
	    mv.setViewName("userprofile");
	    
	    return mv;
	}


}