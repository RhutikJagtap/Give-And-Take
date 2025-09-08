package com.giveandtake.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.giveandtake.dao.UserDao;
import com.giveandtake.daoimpl.UserDaoImpl;
import com.giveandtake.model.User;

@Controller
public class UserAdminSideController {
	
	public UserAdminSideController() {
		System.out.println("User Admin Controller Constructor........");
	}
	
	
	@RequestMapping("/ViewUserPage")
	public String ViewStudentPage(Model model) {
		
		UserDao userDao = new UserDaoImpl();
		List<User> allUser = userDao.getAllUser();
	
		
		model.addAttribute("alluser", allUser);
		
		return "admin/view-student";
	}
	
	

}
