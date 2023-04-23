package com.poly.ps24504.service.impl;

import java.util.List;

import com.poly.ps24504.dao.UserDao;
import com.poly.ps24504.dao.UserDaoImpl;
import com.poly.ps24504.dao.VideoDao;
import com.poly.ps24504.dao.VideoDaoImpl;
import com.poly.ps24504.entity.User;
import com.poly.ps24504.entity.Video;
import com.poly.ps24504.service.UserService;
import com.poly.ps24504.service.VideoService;

public class UserServiceImpl implements UserService  {
	private UserDao dao;
	
	public UserServiceImpl() {
		dao = new UserDaoImpl();
	}

	@Override
	public User findByID(Integer id) {
		// TODO Auto-generated method stub
		return dao.findByID(id);
	}

	@Override
	public User findByEmail(String email) {
		// TODO Auto-generated method stub
		return dao.findByEmail(email);
	}

	@Override
	public User findByUsername(String username) {
		// TODO Auto-generated method stub
		return dao.findByUsername(username);
	}

	@Override
	public User login(String username, String password) {
		// TODO Auto-generated method stub
		return dao.findByUsernameAndPassword(username, password);
	}

	@Override
	public List<User> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}

	@Override
	public List<User> findAll(int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		return dao.findAll(pageNumber, pageSize);
	}

	@Override
	public User resetPassword(String email) {
		// TODO Auto-generated method stub
		User exitsUser = findByEmail(email);
		if(exitsUser != null) {
			String newpass=String.valueOf((int) (Math.random()*((9999-1000)+1)) +1000);
			exitsUser.setPassword(newpass);
			return dao.update(exitsUser);
		}
		return null;
	}

	@Override
	public User register(String username, String password, String email) {
		User user = new User();
		user.setUserName(username);
		user.setPassword(password);
		user.setEmail(email);
//Use Boolean. FALSE if storing data in a Boolean . Use false if storing data in a boolean
		user.setIsADMIN(Boolean.FALSE); 
		user.setIsActive(Boolean.TRUE);
		return dao.create(user);
	}

	@Override
	public User update(User entity) {
		// TODO Auto-generated method stub
		return dao.update(entity);
	}

	@Override
	public User delete(String username) {
		User user = dao.findByUsername(username);
		user.setIsActive(Boolean.FALSE);
		return dao.update(user);
	}
	
	
}
