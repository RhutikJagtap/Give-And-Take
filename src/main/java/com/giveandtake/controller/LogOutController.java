package com.giveandtake.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class LogOutController {

	public LogOutController() {
		System.out.println("Log Out Controller constructor");
	}
	
	@GetMapping("/LogOut")
	public String logOut(HttpSession session)
	{
		session.invalidate();
		System.out.println("Log Out User.......");
		
		return "redirect:/";
	}

}
