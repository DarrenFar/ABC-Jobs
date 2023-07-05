package com.MyProject;



import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.MyProject.entity.User;
import com.MyProject.service.UserService;

@Controller
public class ProjectController {

	@Autowired
	private UserService serv;
	
	//the controller that handles register
	@RequestMapping(value="/process-register")
	public ModelAndView registration(HttpSession session) throws Exception {
		return new ModelAndView("email_verification"); 
	}
	
	@RequestMapping(value = "/process-register", method=RequestMethod.POST)
	public String registration(
			@RequestParam("fullname") String Name,
			@RequestParam("email") String Email,
			@RequestParam("password") String Password, 
			User user, Model model)throws Exception {
		try {
		user.setEmail(Email);
		user.setPassword(Password);
		user.setName(Name);
		serv.register(user);
		model.addAttribute("email", user.getEmail());
		return "email_verification";
	} catch (Exception e) {
		System.out.println(e);
	}
	model.addAttribute("errMsg", "Email has already been used");
	return "register";
}
	
	//the controller that handles the login process
	@RequestMapping(value="/process-login", method = RequestMethod.GET)
	public ModelAndView login(HttpSession session) throws Exception {
		return new ModelAndView("login"); 
	}
	
	@RequestMapping(value="/process-login", method = RequestMethod.POST) // login process
	public ModelAndView login(
			@ModelAttribute("login") User user, Model model, 
			HttpServletRequest req, HttpServletResponse res) {
	
		String rememberMe = req.getParameter("rememberMe");
		HttpSession session = req.getSession();
		User isLogin = serv.login(user);
		
		if(isLogin != null) {
			if(rememberMe != null) { // remember me checked
				Cookie eCookie = new Cookie("email", isLogin.getEmail());
				eCookie.setMaxAge(10 * 60); // 10 minute
				res.addCookie(eCookie);
				
				Cookie iCookie = new Cookie("userId", String.valueOf(isLogin.getUsers_ID()));
				iCookie.setMaxAge(10 * 60);
				res.addCookie(iCookie);
			}
			
			session.setAttribute("email", isLogin.getEmail());
			session.setAttribute("userId", isLogin.getUsers_ID());
			session.setAttribute("isLogin", true);
			model.addAttribute("Halo", "hiihihihi");
			this.setModel(model, session);
			return new ModelAndView("profile");
		}
		
		String msg = "Your password or email might be incorrect";
		model.addAttribute("message", "Your password or email might be incorrect");
		return new ModelAndView("login");
	}
	
	//the controller that handles logout 
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(HttpServletResponse res, HttpSession session) throws Exception {
		session.invalidate();

		Cookie eCookie = new Cookie("email", "");
		eCookie.setMaxAge(0);
		res.addCookie(eCookie);
		
		Cookie iCookie = new Cookie("userId", "");
		iCookie.setMaxAge(0);
		res.addCookie(iCookie);
		
		return "login"; 
	}
	
	//the controller that handles resetting password
	@RequestMapping(value="/process-reset-pass", method = RequestMethod.POST) // forgot password logic
	public String forgotPassword(@RequestParam("email") String email, Model model, HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		String checkEmail = serv.checkEmail(email);
		
		if(checkEmail != null) {
			session.setAttribute("isReset", true);
			session.setAttribute("email", email);
			return "resetPassVeri";
		}
				
		String msg = "Email not found";
		model.addAttribute("message", msg);
		return "forget_password";
	}
	
	@GetMapping("/change-pass")
	public ModelAndView change() {
		ModelAndView mv = new ModelAndView("change_password");
		return mv;
	}
	
	@RequestMapping(value="/reset-pass", method = RequestMethod.POST) // reset password
	public String reset(@RequestParam("password") String password, Model model, HttpSession session) throws Exception {
		try {
			serv.updatePassword(password, (String) session.getAttribute("email"));
			
			String msg = "Password has been changed";
			model.addAttribute("scMessage", msg);
			session.invalidate();
		} catch (Exception e) {
			System.out.println(e);
			return "change_password";
		}
		
		return "login";
	}
	
	//some mapping for the website links
	@GetMapping("/")
	public ModelAndView home(Model model) {
		ModelAndView mv = new ModelAndView("home");
		return mv;
	
	}
	
	@GetMapping("/home")
	public ModelAndView homepage() {
		ModelAndView mv = new ModelAndView("home");
		return mv;
	}
	
	@GetMapping("/form")
	public ModelAndView form() {
		ModelAndView mv = new ModelAndView("form");
		return mv;
	}
	

	@GetMapping("/thank-you-page")
	public ModelAndView thankyou() {
		ModelAndView mv = new ModelAndView("thankyou");
		return mv;
	}
	
	
	@GetMapping("/other-profile")
	public ModelAndView other() {
		ModelAndView mv = new ModelAndView("other-profile");
		return mv;
	}
	
	@GetMapping("/login")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView("login");
		return mv;
	}
	
	@GetMapping("/register")
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView("register");
		return mv;
	}
	
	@GetMapping("/forget_password")
	public ModelAndView forget_password() {
		ModelAndView mv = new ModelAndView("forget_password");
		return mv;
	}
	
	private void setModel(Model model, HttpSession session) {
		String userId = String.valueOf(session.getAttribute("userId"));
		String[] userDetails = serv.getDetailsById(userId).replaceAll("null", "-").split(",");
		String udID = userDetails[0];
		
		model.addAttribute("Name", userDetails[1]);
		model.addAttribute("Country", userDetails[2]);
		model.addAttribute("Education", userDetails[3]);
		model.addAttribute("Experience", userDetails[4]);
		model.addAttribute("Email", userDetails[6]);
		model.addAttribute("Certification", userDetails[5]);
	}
	
//	@RequestMapping(value = "/profile")
//	public ModelAndView profile(HttpSession session, Model model) {
//		try {
//			this.setModel(model, session);
//			return new ModelAndView("profile");  
//		} catch (Exception e) {
//			System.out.println(e);
//			String msg = "Login required";
//			model.addAttribute("message", msg);
//			return new ModelAndView("login");
//		}
//	}
	

	
}
