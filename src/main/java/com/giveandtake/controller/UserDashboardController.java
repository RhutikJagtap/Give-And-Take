package com.giveandtake.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.giveandtake.daoimpl.UserDaoImpl;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserDashboardController {
	
	
	public UserDashboardController() {
		System.out.println("User dashboard controller........");
	}

	
	@PostMapping("/UserLogin")
	public String userDash(@RequestParam("username") String name,@RequestParam("password")String password,HttpSession session )
	{
		UserDaoImpl userDaoImpl = new UserDaoImpl();
		
		if (userDaoImpl.isValidUser(name, password)) {
			session.setAttribute("user", userDaoImpl.getValidUser(name, password));
				return "user/user-dashboard";
		}else {
			return "redirect:/UserLogin";			
		}
		
	}
	
	@GetMapping("/dashboard")
	public String userDashboard()
	{
		return "user/user-dashboard";
	}
	
	
	
	
	
}
