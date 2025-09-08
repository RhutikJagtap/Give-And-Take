package com.giveandtake.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminLogInController {
	
	public AdminLogInController() {
		System.out.println("Admin login constructor....");
	}
	
	@GetMapping("/AdminLoginPage")
	public String showAdminRegister() {
		System.out.println("admin login page loaded....");
		return "admin/admin-login";
	}
	
	
	@PostMapping("/AdminLogin")
	public String studentDash(@RequestParam("username") String name,@RequestParam("password")String password )
	{
		
		if (name.equals("rhutik") && password.equals("rhutik123")) {
				return "admin/admin-dashboard";
		}else {
			return "redirect:/AdminLogin";			
		}
		
	}
	
	@GetMapping("/admin-dashboard")
	public String studentDashboard()
	{
		return "admin/admin-dashboard";
	}

}
