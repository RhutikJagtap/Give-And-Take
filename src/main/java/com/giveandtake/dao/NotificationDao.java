package com.giveandtake.dao;

import java.util.List;

import com.giveandtakemodel.Notification;
import com.giveandtakemodel.User;

public interface NotificationDao {
    public void addNotification(int userId, String message, String type);
    public List<Notification> getUserNotifications(User user);
	public int markAsRead(int notificationId);

}
