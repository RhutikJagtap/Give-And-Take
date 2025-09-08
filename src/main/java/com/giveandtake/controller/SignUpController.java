package com.giveandtake.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.giveandtake.dao.UserDao;
import com.giveandtake.daoimpl.UserDaoImpl;
import com.giveandtakemodel.User;

@Controller
public class SignUpController {

	@GetMapping("/UserLogin")
	public String showStudentLogin() {
		System.out.println("User login page loaded....");
		return "user/user-login"; // resolves to /WEB-INF/views/student/student-login.jsp
	}

	@GetMapping("/SignUpUser")
	public String signup() {
		System.out.println("user sign up page loaded.......");
		return "user/user-register";
	}

	@PostMapping("/UserSignUP")
	public String saveStudent(@ModelAttribute User user, Model model) {
		UserDao userDao = new UserDaoImpl();
		int count = userDao.addUser(user);

		model.addAttribute("count", count);

		if (count > 0) {
			System.out.println(user.getName() + " saved user successfully............");
			return "user/user-login";
		} else {
			return "user/user-register";
		}
	}

}
