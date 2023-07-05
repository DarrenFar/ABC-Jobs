package com.MyProject;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.MyProject.entity.User;
import com.MyProject.service.UserService;



@Controller
public class AdminController {
	@Autowired
	private UserService serv;
	//Admin dashboard controller
	@RequestMapping(value="/3Pf4D5qX4v") 
	public ModelAndView index(Model model, HttpSession session) {
		String name = serv.getDetailsById(session.getAttribute("userId").toString()).split(",")[1];
		model.addAttribute("adminName", name);
		return new ModelAndView("admin");
	}
	
	//Show all user controller
	@RequestMapping(value="/SPvC6mcDbK") 
	public ModelAndView allUsers(Model model, HttpSession session) {
		List<User> users = serv.getAllUserDetails();
		model.addAttribute("users", users);
		return new ModelAndView("show-user");
	}
	
	//Delete user controller
	@RequestMapping(value="/PadsNsIda1") 
	public String deleteUserById(@RequestParam("uId") Long uId, Model model) {
		boolean isDeleted = serv.deleteUserById(uId);
		if(isDeleted) {
			model.addAttribute("err", "Cannot delete this user");
		}
		
		return "admin";
	}

	//edit user controller
	@RequestMapping(value = "/VjSSBQ2ZVb")
	public ModelAndView profile(@RequestParam("uId") Long uId, Model model, HttpSession session, User profile) {
		User userDetails = serv.getDetailsById(uId);
		
		profile.setUsers_ID(userDetails.getUsers_ID());
		profile.setName(userDetails.getName());
		profile.setEmail(userDetails.getEmail());
		profile.setCountry(userDetails.getCountry());
		profile.setEducation(userDetails.getEducation());
		profile.setCertification(userDetails.getCertification());
		profile.setExperience(userDetails.getExperience());

		this.setModel(profile, model, session);
		return new ModelAndView("admin-edit");
	}
	
	@RequestMapping(value="/xViE4KB9FC", method = RequestMethod.POST) // update profile POST
	public String up(@ModelAttribute("profile") User userDetails, Model model, HttpSession session) {
		Long userDetailsId = userDetails.getUsers_ID();
		serv.updateProfile(userDetailsId, userDetails);
		return "admin";
	}
	
	//set model
	private void setModel(User profile, Model model, HttpSession session) {

		model.addAttribute("id", profile.getUsers_ID());
		model.addAttribute("Name", profile.getName());
		model.addAttribute("Country", profile.getCountry());
		model.addAttribute("Education", profile.getEducation());
		model.addAttribute("Experience", profile.getExperience());
		model.addAttribute("Email", profile.getEmail());
		model.addAttribute("Certification", profile.getCertification());
	}
}
