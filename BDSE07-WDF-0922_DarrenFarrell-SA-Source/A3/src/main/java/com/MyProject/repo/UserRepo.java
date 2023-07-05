package com.MyProject.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.MyProject.entity.User;

//queries for users table
public interface UserRepo extends JpaRepository<User, Long>{
	@Query(value = "SELECT * FROM users ORDER BY Users_ID DESC LIMIT 1", nativeQuery = true) 
	String getLastUser();
	
	@Query(value = "SELECT * FROM users WHERE :email = email AND :password = password", nativeQuery = true)
	User login(@Param("email") String email, @Param("password") String password);

	@Query(value = "SELECT * FROM users WHERE Email = :email", nativeQuery = true)
	String checkEmail(@Param("email") String email);
	
	@Query(value = "SELECT Users_ID, Name, Country, Education, Experience, Certification, Email FROM users" 
			+ " WHERE Users_ID = :userId", nativeQuery = true)
	public String getDetailsById(@Param("userId") String userId);
	
	@Query(value = "SELECT * FROM users"
	 		+ " WHERE Name LIKE %:key%"
	 		+ " OR Email LIKE %:key%"
	 		+ " OR Education LIKE %:key%", nativeQuery = true)
	public List<User> searchByKey(@Param("key") String key);
}
