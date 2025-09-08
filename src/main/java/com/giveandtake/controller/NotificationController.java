package com.giveandtake.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.giveandtake.dao.NotificationDao;
import com.giveandtake.daoimpl.NotificationDaoImpl;
import com.giveandtakemodel.Notification;
import com.giveandtakemodel.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class NotificationController {
	
	public NotificationController() {
		System.out.println("Notification  Controller constructor.............");
	}
	
	@RequestMapping("/NotificationsPage")
	public String notificationsPage(Model model,HttpSession session) {
		
		User user =(User) session.getAttribute("user");
		
		NotificationDao notificationDao = new NotificationDaoImpl();
		List<Notification> notifications = notificationDao.getUserNotifications(user);
		
		model.addAttribute("notifications",notifications);
		
		return "user/notifications";
	}
	
	@RequestMapping("/MarkAsRead")
	public String markAsRead(@RequestParam("notificationId") int  notificationId)
	{
		NotificationDao notificationDao = new NotificationDaoImpl();
		int count = notificationDao.markAsRead(notificationId);
		
		if (count>0) {
			System.out.println("Notification marked as read");
		}else {
			System.out.println("Notification not  marked as read .....problem");
		}
		
		return "forward:/NotificationsPage";
	}
	

}
