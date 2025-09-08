package com.giveandtake.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.giveandtake.dao.ItemDao;
import com.giveandtake.dao.NotificationDao;
import com.giveandtake.daoimpl.ItemDaoImpl;
import com.giveandtake.daoimpl.NotificationDaoImpl;
import com.giveandtake.model.Item;

@Controller
public class ManageItemsController {

	public ManageItemsController() {
		
		System.out.println("Manage items controller constructor...........");
	}
	
	@RequestMapping("/ManageItemsPage")
	public String manageItems(Model model)
	{
		ItemDao itemDao = new ItemDaoImpl();
		List<Item> itemsList = itemDao.getAllItemRequestPending();
		
		model.addAttribute("itemList", itemsList);
		
		return "admin/manage-items";
	}
	
	@RequestMapping("/ApproveItem")
	public String approveRequest(@RequestParam("action") String action,@RequestParam("itemId") int itemId)
	{
//		System.out.println(action);
		ItemDao itemDao = new ItemDaoImpl();
		Item item = itemDao.getItemById(itemId);
		int count = itemDao.approveItemRequest(item,action);
		
		if (count>0) {
			System.out.println("Item request approved succesfully");
			//add notification
			NotificationDao nf=new NotificationDaoImpl();
			nf.addNotification(item.getOwnerId(),"Your request for "+item.getItemName()+" was approved by admin." , "approved");
			
		}else {
			System.out.println("Item request not  approved problem.........");
		}
		
		return "redirect:/ManageItemsPage";
	}
	
	@RequestMapping("/RejectItem")
	public String rejectRequest(@RequestParam("action") String action,@RequestParam("itemId") int itemId)
	{
//		System.out.println(action);
		ItemDao itemDao = new ItemDaoImpl();
		Item item = itemDao.getItemById(itemId);
		int count = itemDao.rejectItemRequest(item,action);
		
		if (count>0) {
			System.out.println("Item request reject succesfully");
			
			//add notification
			NotificationDao nf=new NotificationDaoImpl();
			nf.addNotification(item.getOwnerId(),"Your request for "+item.getItemName()+" was rejected by admin." , "rejected");
			
			
		}else {
			System.out.println("Item request not  reject problem.........");
		}
		
		return "redirect:/ManageItemsPage";
	}
	
	
	@RequestMapping("/AllItems")
	public String allItemsPage(Model model) {
		
		ItemDao itemDao = new ItemDaoImpl();
		List<Item> allItem = itemDao.getAllItem();
		
		model.addAttribute("allItems",allItem);
		
		return "admin/all-items";
	}
	
	@RequestMapping("/DeleteItem")
	public String deleteItem(@RequestParam("itemId") int itemId)
	{
		
		ItemDao itemDao = new ItemDaoImpl();
		int count = itemDao.deleteItemById(itemId);
		
		if (count>0) {
			System.out.println("item deleted successfully ");
		} else {
			System.out.println("item not deleted ");

		}
		
		return "forward:/AllItems";
	}
	
	
	
}
