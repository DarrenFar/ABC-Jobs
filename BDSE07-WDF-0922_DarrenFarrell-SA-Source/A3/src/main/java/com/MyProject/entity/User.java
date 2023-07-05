package com.MyProject.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

//users model
@Entity
@Table(name="users")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="Users_ID")
	private Long Users_ID;
	
	@Column(name = "Name")
	private String Name;
	
	@Column(name = "Email")
	private String Email;
	
	@Column(name = "Password")
	private String Password;
	
	@Column(name = "Country")
	private String Country;
	
	@Column(name = "Education")
	private String Education;
	
	@Column(name = "Experience")
	private String Experience;
	
	@Column(name = "Certification")
	private String Certification;

	public User(Long Users_ID, String Name, String Email, String Password, String Country, String Education, String Experience, String Certification) {
		super();
		this.Users_ID = Users_ID;
		this.Name = Name;
		this.Email = Email;
		this.Password = Password;
		this.Country = Country;
		this.Education = Education;
		this.Experience = Experience;
		this.Certification = Certification;
		
	}
	
	public String getCountry() {
		return Country;
	}

	public void setCountry(String country) {
		Country = country;
	}

	public String getEducation() {
		return Education;
	}

	public void setEducation(String education) {
		Education = education;
	}

	public String getExperience() {
		return Experience;
	}

	public void setExperience(String experience) {
		Experience = experience;
	}

	public String getCertification() {
		return Certification;
	}

	public void setCertification(String certification) {
		Certification = certification;
	}

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Long getUsers_ID() {
		return Users_ID;
	}

	public void setUsers_ID(Long users_ID) {
		Users_ID = users_ID;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}





	
}
