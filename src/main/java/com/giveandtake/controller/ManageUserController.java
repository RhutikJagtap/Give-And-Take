package com.giveandtake.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.giveandtake.dao.UserDao;
import com.giveandtake.daoimpl.UserDaoImpl;
import com.giveandtakemodel.User;

@Controller
public class ManageUserController {
	

	public ManageUserController() {
		
		System.out.println("Manage user controller constructor...........");
	}
	
	@RequestMapping("/ManageUserPage")
	public String manageUser(Model model)
	{
		UserDao userDao = new UserDaoImpl();
		List<User> allUser = userDao.getAllUser();
		
		model.addAttribute("alluser",allUser);
		
		return "admin/manage-user";
	}
	
	

}
