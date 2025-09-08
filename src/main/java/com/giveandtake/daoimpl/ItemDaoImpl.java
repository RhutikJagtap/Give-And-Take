package com.giveandtake.daoimpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.giveandtake.dao.ItemDao;
import com.giveandtake.model.Item;

public class ItemDaoImpl implements ItemDao {

	private Session session;
	private Transaction tx;

	public ItemDaoImpl() {
		Configuration cfg = new Configuration();
		cfg.configure();
		cfg.addAnnotatedClass(Item.class);

		SessionFactory sessionfactory = cfg.buildSessionFactory();
		session = sessionfactory.openSession();
		tx = session.beginTransaction();
	}

	@Override
	public int addItem(Item item) {
			int count = (int)session.save(item);
			tx.commit();

		return count;
	}

	@Override
	public List<Item> getItemByUserId(int userId) {
		
		String hql="From Item WHERE ownerId=:userId";
		
		Query<Item> query = session.createQuery(hql);
		query.setParameter("userId", userId);
		
		List<Item> list = query.getResultList();
		
		
		return list;
	}
	
	
	@Override
	public List<Item> getAllItemRequestHasAccepted() {
		String hql="From Item where status=:status";
		
		Query query = session.createQuery(hql);
		query.setParameter("status", "Approved");
		
		List<Item> itemList = query.getResultList();
		
		return itemList;
	}

	@Override
	public List<Item> getAllItemRequestPending() {
		
		String hql="From Item where status=:status";
		
		Query query = session.createQuery(hql);
		query.setParameter("status", "Pending");
		
		List<Item> itemList = query.getResultList();
		
		return itemList;
	}
	
	@Override
	public Item getItemById(int itemId) {
		
		Item item = session.get(Item.class, itemId);
		return item;
	}

	@Override
	public int approveItemRequest(Item item, String action) {
		item.setStatus("Approved");
		session.update(item);
		tx.commit();
		return 1;
	}
	
	
	@Override
	public int rejectItemRequest(Item item, String action) {
		
		session.delete(item);
		
		tx.commit();
		return 1;
	}

	@Override
	public List<Item> getAllItem() {
		
		String hql="From Item i";
		
		Query<Item> query = session.createQuery(hql);
		List<Item> list = query.getResultList();
		
		return list;
	}

	@Override
	public int deleteItemById(int itemId) {
		
		Item item = session.get(Item.class, itemId);
		
		session.delete(item);
		
		tx.commit();
		
		return 1;
	}
}
