package com.giveandtake.dao;

import java.util.List;

import com.giveandtakemodel.Item;

public interface ItemDao {
	
	int addItem(Item item);
	
	List<Item> getItemByUserId(int userId);
	
	List<Item> getAllItemRequestHasAccepted();

	List<Item> getAllItemRequestPending();

	Item getItemById(int itemId);

	int approveItemRequest(Item item, String action);
	
	int rejectItemRequest(Item item,String action);

	List<Item> getAllItem();

	int deleteItemById(int itemId);
	
}
