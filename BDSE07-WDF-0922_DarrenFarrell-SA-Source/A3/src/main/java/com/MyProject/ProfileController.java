package com.MyProject;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.MyProject.entity.User;
import com.MyProject.service.UserService;

@Controller
public class ProfileController {

	@Autowired
	private UserService serv;

	//profile page controller
	@RequestMapping(value = "/profile")
	public ModelAndView profile(HttpSession session, Model model) {
		try {
			this.setModel(model, session);
			model.addAttribute("tester", "halohalohalo");
			return new ModelAndView("profile");  
		} catch (Exception e) {
			System.out.println(e);
			String msg = "Login required";
			model.addAttribute("message", msg);
			return new ModelAndView("login");
		}
	}
	
	private void setModel(Model model, HttpSession session) {
		String userId = String.valueOf(session.getAttribute("userId"));
		String[] userDetails = serv.getDetailsById(userId).replaceAll("null", "-").split(",");
		String udID = userDetails[0];
		
		model.addAttribute("id", userDetails[0]);
		model.addAttribute("Name", userDetails[1]);
		model.addAttribute("Country", userDetails[2]);
		model.addAttribute("Education", userDetails[3]);
		model.addAttribute("Experience", userDetails[4]);
		model.addAttribute("Email", userDetails[6]);
		model.addAttribute("Certification", userDetails[5]);
		
	}

	//the controller that handles updating profile
	@RequestMapping(value="/update-profile") // update profile GET
	public ModelAndView updateProfile(Model model, HttpSession session) throws Exception {
		try {
			this.setModel(model, session);
			return new ModelAndView("edit-profile");  
		} catch (Exception e) {
			System.out.println(e);
			String msg = "Login required";
			model.addAttribute("message", msg);
			return new ModelAndView("login/login");
		}
	}
	
	@RequestMapping(value="/update-profile", method = RequestMethod.POST) // update profile POST
	public String up(
			@ModelAttribute("profile") User user,
			@RequestParam("name") String Name,
			@RequestParam("email") String Email,
			@RequestParam("country") String Country,
			@RequestParam("education") String Education,
			@RequestParam("experience") String Experience,
			@RequestParam("certification") String Certification,
			Model model, HttpSession session) {
		
		Long userId = Long.parseLong(String.valueOf(session.getAttribute("userId")));
		serv.updateProfile(userId, user);
		
		
		this.setModel(model, session);
		
		String msg = "Profile has been updated";
		model.addAttribute("message", msg);
		return "profile";
	}
	
}
