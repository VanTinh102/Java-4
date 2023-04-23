package com.poly.ps24504.dao;

import java.util.List;

import com.poly.ps24504.entity.User;

public class UserDaoImpl extends AbstractDao<User> implements UserDao {

	@Override
	public User findByID(Integer id) {
		return super.findByID(User.class, id);
	}

	@Override
	public User findByEmail(String email) {
		String jpql = "Select o from User o where o.email = ?0";
		return super.findOne(User.class, jpql, email);
	}
 
	@Override
	public User findByUsername(String username) {
		String jpql = "Select o from User o where o.userName = ?0";
		return super.findOne(User.class, jpql, username);
	}

	@Override
	public User findByUsernameAndPassword(String username, String password) {
		String jpql = "Select o from User o where o.userName = ?0 and o.password = ?1";
		return super.findOne(User.class, jpql, username, password);
	}

	@Override
	public List<User> findAll() {
		// TODO Auto-generated method stub
		return super.findAll(User.class,true);
	}

	@Override
	public List<User> findAll(int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		return super.findAll(User.class, true, pageNumber, pageSize);
	}
}
