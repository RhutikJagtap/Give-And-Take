package com.giveandtake.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.giveandtake.dao.ItemDao;
import com.giveandtake.daoimpl.ItemDaoImpl;
import com.giveandtake.model.Item;

@Controller
public class BrowseItemsController {
	public BrowseItemsController() {

		System.out.println("Browse Items Controller constructor.............");
	}

	@RequestMapping("/BrowseItemsPage")
	public String browseItemsPage(Model model) {
		
		ItemDao itemDao = new ItemDaoImpl();
		List<Item> allItem = itemDao.getAllItemRequestHasAccepted();
		
		model.addAttribute("allItem",allItem);
		
		return "user/browse-items";
	}
	
	@RequestMapping("/ItemDetailsPage")
	public String itemDetailsPage()
	{
		
		return "user/item-details";
	}
	
	

}
