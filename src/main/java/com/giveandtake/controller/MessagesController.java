package com.giveandtake.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MessagesController {
	
	public MessagesController() {
		System.out.println("Messages  Controller constructor.............");
	}

	@RequestMapping("/MessagesPage")
	public String browseItemsPage() {
		return "user/messages";
	}
}
