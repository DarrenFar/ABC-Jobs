package com.MyProject;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.MyProject.entity.User;
import com.MyProject.service.UserService;

@Controller
public class searchController {
	
	@Autowired
	UserService serv;

	//controller for the search functionality
	@RequestMapping(value="/searching")
	public ModelAndView search(HttpServletRequest req, Model model) throws Exception {
		String search = req.getParameter("search");
		
		
		if(search != null && !search.equals("")) {
			search = search.split(" ")[0];
			List<User> selectedUser = serv.searchByKey(search);
			model.addAttribute("selected", selectedUser);
			
			if(selectedUser.size() == 0) {
				model.addAttribute("notFound", true);
			}
		}
		return new ModelAndView("search-result");  
	}
	
	//controller for showing the results of the search
	@RequestMapping(value="/result", method = RequestMethod.POST) // view someone profile
	public ModelAndView searchProfile(@RequestParam("uId") String uId, Model model, HttpSession session) throws Exception {
		this.setModelSearch(model, session, uId);
		return new ModelAndView("other-profile");  
	}
	
	private void setModelSearch(Model model, HttpSession session, String uId) {
		String userId = String.valueOf(uId);
		String[] userDetails = serv.getDetailsById(userId).replaceAll("null", "-").split(",");
		String udID = userDetails[0];
		
		model.addAttribute("Name", userDetails[1]);
		model.addAttribute("Country", userDetails[2]);
		model.addAttribute("Education", userDetails[3]);
		model.addAttribute("Experience", userDetails[4]);
		model.addAttribute("Email", userDetails[6]);
		model.addAttribute("Certification", userDetails[5]);
		
	}

}
