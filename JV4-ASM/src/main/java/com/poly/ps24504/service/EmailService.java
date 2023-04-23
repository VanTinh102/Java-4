package com.poly.ps24504.service;

import javax.servlet.ServletContext;

import com.poly.ps24504.entity.User;

public interface EmailService {
	void sendEmail (ServletContext context, User recipient, String type);
}
