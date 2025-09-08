package com.giveandtake.daoimpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.giveandtake.dao.UserDao;
import com.giveandtake.model.User;

public class UserDaoImpl implements UserDao{
	
	 private Session session;
		private Transaction tx;

		public UserDaoImpl() {
	    	Configuration cfg = new Configuration();
			cfg.configure();
			cfg.addAnnotatedClass(User.class);


			SessionFactory sessionfactory = cfg.buildSessionFactory();
			session = sessionfactory.openSession();
			tx=session.beginTransaction();
		}

		@Override
		public int addUser(User user) {
			int i = (int) session.save(user);
			tx.commit();
			return i;
		}
		
		@Override
		public User getUserById(int id) {
			User user =session.get(User.class, id);
			return user;
		}
		
		
		public boolean  isValidUser(String username,String password) {
			boolean isValid=false;
			
			String hql="FROM User WHERE userName=:username AND password=:password";
			
			Query query = session.createQuery(hql);
			query.setParameter("username", username);
			query.setParameter("password", password);
			User user=null;
			
			
			try {
				 user =(User) query.getSingleResult();
				
			} catch (Exception e) {
				System.out.println("no user");
			}
			
			if (user!=null) {
				System.out.println("User found "+user.getUserName());
				isValid=true;
			}else {
				System.out.println("No user found with the given userName and password");
			}
			
			
			return isValid;
		}

		public User  getValidUser(String username,String password) {
			boolean isValid=false;
			
			String hql="FROM User WHERE userName=:username AND password=:password";
			
			Query query = session.createQuery(hql);
			query.setParameter("username", username);
			query.setParameter("password", password);
			User user=null;
			
			
			try {
				 user =(User) query.getSingleResult();
				
			} catch (Exception e) {
				System.out.println("no user");
			}
			
			if (user!=null) {
				System.out.println("User found "+user.getUserName());
				return user;
			}else {
				System.out.println("No user found with the given userName and password");
			}
			
			
			return user;
		}
		
		@Override
		public int updateUser(User user) {
			UserDaoImpl userDao = new UserDaoImpl();
			User validUser = userDao.getValidUser(user.getUserName(), user.getPassword());
	
			session.update(validUser);
			tx.commit();
			
			return 1;
		}

		@Override
		public List<User> getAllUser() {
			
			String hql="From User u";
			
			Query<User> query = session.createQuery(hql);
			
			List<User> allUser = query.getResultList();
			
			return allUser;
		}
		
		
		
}
