package com.giveandtake.daoimpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.giveandtake.dao.NotificationDao;
import com.giveandtake.dao.UserDao;
import com.giveandtake.model.Notification;
import com.giveandtake.model.User;

public class NotificationDaoImpl implements NotificationDao {

	private Session session;
	private Transaction tx;

	public NotificationDaoImpl() {
		Configuration cfg = new Configuration();
		cfg.configure();
		cfg.addAnnotatedClass(Notification.class);
		cfg.addAnnotatedClass(User.class);

		SessionFactory sessionfactory = cfg.buildSessionFactory();
		session = sessionfactory.openSession();
		tx = session.beginTransaction();
	}

	@Override
	public void addNotification(int userId, String message, String type) {
		UserDao userDao = new UserDaoImpl();
		User user = userDao.getUserById(userId);
		
		Notification notification = new Notification();
		notification.setUser(user);
		notification.setMessage(message);
		notification.setType(type);

		session.persist(notification);
		tx.commit();
	}

	public List<Notification> getUserNotifications(User user) {
		return session
				.createQuery("FROM Notification n WHERE n.user = :user and  n.isRead = false ORDER BY n.createdAt DESC", Notification.class)
				.setParameter("user", user).getResultList();
	}

	@Override
	public int markAsRead(int notificationId) {
		
		Notification notification = session.get(Notification.class, notificationId);
		notification.setRead(true);
		session.update(notification);
		
		tx.commit();
		
		return 1;
	}

}
