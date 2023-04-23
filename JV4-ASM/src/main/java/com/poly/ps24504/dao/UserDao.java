package com.poly.ps24504.dao;

import java.util.List;

import com.poly.ps24504.entity.User;

public interface UserDao {
	User findByID(Integer id);
	User findByEmail(String email);
	User findByUsername(String username);
	User findByUsernameAndPassword(String username, String password);
	List<User> findAll();
	List<User> findAll(int pageNumber, int pageSize);
	User create(User entity);
	User update(User entity);
	User delete(User entity);
}
