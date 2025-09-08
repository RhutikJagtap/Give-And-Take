package com.giveandtake.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.giveandtake.dao.UserDao;
import com.giveandtake.daoimpl.UserDaoImpl;
import com.giveandtake.model.User;

@Controller
public class ProfileController {
	
	public ProfileController() {
		System.out.println("Profile Controller...............");
	}
	
	@GetMapping("/ProfilePage")
	public String profilePage()
	{
		return "user/profile";
	}
	
	@PostMapping("/UpdateUser")
	public String updateProfile(@ModelAttribute User user) {
		
		UserDao userDao = new UserDaoImpl();
		int count = userDao.updateUser(user);
		
		if (count>0) {
			System.out.println("user updated successfully..........");
			return "user/profile";
		}else {
			System.out.println("user not updated error............");
			return "user/profile";
		}
		
	}
	
	
	
	

}
