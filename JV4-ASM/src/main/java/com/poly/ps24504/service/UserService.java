package com.poly.ps24504.service;

import java.util.List;

import com.poly.ps24504.entity.User;

public interface UserService {
	User findByID(Integer id);
	User findByEmail(String email);
	User findByUsername(String username);
	User login(String username, String password);
	List<User> findAll();
	List<User> findAll(int pageNumber, int pageSize);
	User resetPassword(String email);
	User register(String username, String password, String email);
	User update(User entity);
	User delete(String username);
}
