package com.giveandtake.dao;

import java.util.List;

import com.giveandtake.model.User;

public interface UserDao {
	
	int addUser(User user);
	
	User getUserById(int id);

	int updateUser(User user);
	
	List<User> getAllUser();
	
}
