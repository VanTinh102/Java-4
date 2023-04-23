package com.poly.ps24504.dao;

import java.util.Iterator;
import java.util.List;

import javax.management.RuntimeErrorException;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import com.poly.ps24504.util.JavaUtil;

public class AbstractDao<T> {
	public static final EntityManager em = JavaUtil.getEntityManager();
	
	@SuppressWarnings("deprecation")
	@Override
	protected void finalize() throws Throwable {
		em.close();
		super.finalize();
	}
	
	public T findByID(Class<T> clazz, Integer id ) {
		return em.find(clazz, id);
	}
	
	//select o from T o where isActive = 1 
	public List<T> findAll(Class<T> clazz, Boolean exitsIsAvtive) {
		String entityName = clazz.getSimpleName();
		StringBuilder jpql = new StringBuilder();
		jpql.append("select o from ").append(entityName).append(" o");
		if(exitsIsAvtive == true) {
			jpql.append(" where isActive = 1");
		}
		TypedQuery<T> query = em.createQuery(jpql.toString(), clazz);
		return query.getResultList();
	}
	
	//find page
	public List<T> findAll(Class<T> clazz, Boolean exitsIsAvtive, int pageNumber, int pageSize) {
		String entityName = clazz.getSimpleName();
		StringBuilder jpql = new StringBuilder();
		jpql.append("select o from ").append(entityName).append(" o");
		if(exitsIsAvtive) {
			jpql.append(" where isActive = 1");
		}
		TypedQuery<T> query = em.createQuery(jpql.toString(), clazz);
		query.setFirstResult( (pageNumber-1) * pageSize); //vị trí bắt đầu : từ 0 nen auto trừ 1 cho đúng
		query.setMaxResults(pageSize);
		return query.getResultList();
	}
	
	public T findOne(Class<T> clazz, String jpql, Object... params) {
		TypedQuery<T> query = em.createQuery(jpql, clazz);
		for(int i=0; i<params.length; i++) {
			query.setParameter(i, params[i]);
		}
		List<T> list = query.getResultList(); //ko sài getSingle... ==> tránh trường hợp null
		if(list.isEmpty()) {
			return null;
		}
		return list.get(0);
	}
	public List<T> findMany(Class<T> clazz, String jpql, Object... params) {
		TypedQuery<T> query = em.createQuery(jpql, clazz);
		for(int i=0; i<params.length; i++) {
			query.setParameter(i, params[i]);
		}
		return query.getResultList();
	}
	public List<Object[]> findManyByNativeQuery( String jpql, Object... params) {
		Query query = em.createNativeQuery(jpql);
		for(int i=0; i<params.length; i++) {
			query.setParameter(i, params[i]);
		}
		return query.getResultList();
	}
	
	///////////////////////
	public T create(T entity) {
		try {
			em.getTransaction().begin();
			em.persist(entity);
			em.getTransaction().commit();
			System.out.println("Create success");
			return entity;
		} catch (Exception e) {
			em.getTransaction().rollback();
			System.out.println("Cannot insert " + entity.getClass().getSimpleName());
			throw new RuntimeException(e);
		}
	}
	public T update(T entity) {
		try {
			em.getTransaction().begin();
			em.merge(entity);
			em.getTransaction().commit();
			System.out.println("Update success");
			return entity;
		} catch (Exception e) {
			em.getTransaction().rollback();
			System.out.println("Cannot update " + entity.getClass().getSimpleName());
			throw new RuntimeException(e);
		}
	}
	public T delete(T entity) {
		try {
			em.getTransaction().begin();
			em.remove(entity);
			em.getTransaction().commit();
			System.out.println("Delete success");
			return entity;
		} catch (Exception e) {
			em.getTransaction().rollback();
			System.out.println("Cannot delete " + entity.getClass().getSimpleName());
			throw new RuntimeException(e);
		}
	}
	
}
