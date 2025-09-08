package com.giveandtake.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReportIssueController {
	
	public ReportIssueController() {
		System.out.println("Report Issue Controller constructor");
	}
	
	@GetMapping("/ReportIssuePage")
	public String reportIssueController()
	{
		System.out.println("Report issue page ");
		return "student/report-issue";
	}

}
