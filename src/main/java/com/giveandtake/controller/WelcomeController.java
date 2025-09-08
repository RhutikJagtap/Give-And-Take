package com.giveandtake.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WelcomeController {

	@GetMapping("/welcome")
	public String firstController() {

		System.out.println("welcome controller");

		return "role";
	}

}
