package com.java.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.java.model.Order;


@Repository
public class OrderDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Transactional(readOnly = true)
	public List<Order> getOrders() {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		Query<Order> q = session.createQuery("from Order", Order.class);
		List<Order> list = q.getResultList();
		t.commit();
		return list;
	}

	public Order getOrderById(Integer id) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		Order order = session.get(Order.class, id);
		t.commit();
		session.close();
		return order;
	}

    @Transactional
	public void addOrder(Order order) {
		Session session = sessionFactory.getCurrentSession();
		session.save(order);
	}

	public void updateOrder(Order updatedOrder) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();

		Order existingOrder = getOrderById(updatedOrder.getOrderId());

		if (existingOrder != null) {
			existingOrder.setVendorName(updatedOrder.getVendorName());
			existingOrder.setShippingAddress(updatedOrder.getShippingAddress());
			existingOrder.setStatus(updatedOrder.getStatus());
			existingOrder.setDeliveryDate(updatedOrder.getDeliveryDate());

			session.update(existingOrder);
			transaction.commit();
			session.close();
		} else {
			throw new IllegalArgumentException("Order not found with id: ");
		}
	}

	public void deleteOrder(Integer orderId) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		Order existingOrder = getOrderById(orderId);
		session.delete(String.valueOf(orderId),existingOrder);
		transaction.commit();
		session.close();
	}

}
