package com.poly.ps24504.util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JavaUtil {
	public static EntityManagerFactory factory;
	public static EntityManager getEntityManager() {
		if(factory == null || factory.isOpen() ) {
			factory = Persistence.createEntityManagerFactory("asmjv4");
		}
//		EntityManagerFactory emf = Persistence.createEntityManagerFactory("asmjv4");
		return factory.createEntityManager();
	}
	
	public static void shutdown() {
		if(factory != null && factory.isOpen()) {
			factory.close();
		}
		factory = null;
	}

}
