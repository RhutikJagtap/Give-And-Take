package com.giveandtake.controller;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.giveandtake.dao.ItemDao;
import com.giveandtake.daoimpl.ItemDaoImpl;
import com.giveandtakemodel.Item;
import com.giveandtakemodel.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class MyItemsController {
	
	public MyItemsController() {
		
		System.out.println("My Items Controller constructor.............");
	}
	
	@RequestMapping("/MyItemsPage")
	public String myItemsPage(Model model,HttpSession session)
	{
	    User user = (User) session.getAttribute("user");

	    
		ItemDaoImpl itemDao = new ItemDaoImpl();
		List<Item> items = itemDao.getItemByUserId(user.getUserId());
		model.addAttribute("items", items);
		
		return "user/my-items";
	}
	
	@RequestMapping("/AddItemPage")
	public String addItemPage()
	{
		return "user/add-item";
	}

	
	@PostMapping("/AddNewItem")
	public String addItem(@ModelAttribute Item item,
	                      HttpSession session) {
		
		System.out.println(item.getItemName());
		System.out.println(item.getDescription());

	    // 1. Set owner and status
	    User user = (User) session.getAttribute("user");
	    item.setOwnerId(user.getUserId());
	    item.setStatus("Pending");

	    
	    // 3. Set addedDate
	    item.setAddedDate(new Date());

	    // 4. Save item using DAO
	    ItemDao itemDao = new ItemDaoImpl();
	    int count = itemDao.addItem(item);

	    if (count > 0) {
	        System.out.println("Item added successfully");
	    } else {
	        System.out.println("Item not added");
	    }

	    return "redirect:/MyItemsPage";
	}

	
	@RequestMapping("/EditItemPage")
	public String editItemPage(@RequestParam("itemId") int itemId, Model model)
	{
		ItemDao itemDao = new ItemDaoImpl();
		Item item = itemDao.getItemById(itemId);
		
		model.addAttribute("item", item);
		
		return "user/edit-item";
	}
	
}
