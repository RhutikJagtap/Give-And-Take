package com.giveandtake.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminDashBoardController {
	
	public AdminDashBoardController() {
		System.out.println("Admin Dashboard controller constructor..............");
	}
	
	
	@RequestMapping("admin-dashboard")
	public String admindashboard()
	{
		return "admin/admin-dashboard";
	}

}
