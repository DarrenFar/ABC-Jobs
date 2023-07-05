package com.MyProject.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MyProject.entity.User;
import com.MyProject.repo.UserRepo;



@Service
@Transactional
public class UserService {
	@Autowired
	private UserRepo userRepo;
	//register method
	public User register(User user) {
		return userRepo.save(user);
	}
	//login method 
	public User login(User user) {
		try {
			User login = userRepo.login(user.getEmail(), user.getPassword());
			return login;
		} catch (Exception e) {
			System.out.println("Credential is null " + e);
		}
		return null;
	}
	
	//check email for email validation
	public String checkEmail(String email) {
		return userRepo.checkEmail(email);
	}
	
	//method for forget password
	public User updatePassword(String password, String email) {
		Long userId = Long.parseLong(userRepo.checkEmail(email).split(",")[0]);
		User user = userRepo.findById(userId).get();
		
		// update 
		user.setPassword(password);
		
		// save
		return userRepo.save(user);
	}

	//get all the user details by id
	public String getDetailsById(String userId) {
		return userRepo.getDetailsById(userId);
	}

	public User updateProfile(Long userId, User user) {
		User userDetails = userRepo.findById(userId).get();
		
		// update
		userDetails.setUsers_ID(user.getUsers_ID());
		userDetails.setName(user.getName());
		userDetails.setCountry(user.getCountry());
		userDetails.setEducation(user.getEducation());
		userDetails.setExperience(user.getExperience());
		userDetails.setCertification(user.getCertification());
		userDetails.setEmail(user.getEmail());

		
		// save
 		return userRepo.save(userDetails);
		
	}

	//method for searching other users
	public List<User> searchByKey(String key) {
		return userRepo.searchByKey(key);
	}

	//method for getting all of the user details
	public List<User> getAllUserDetails() {
		return userRepo.findAll();
	}
	
	//method for deleting user for administrator
	public boolean deleteUserById(Long id) {
		try {
			userRepo.deleteById(id);
			return true;
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}
	
	public User getDetailsById(Long id) {
		return userRepo.findById(id).get();
	}

}
