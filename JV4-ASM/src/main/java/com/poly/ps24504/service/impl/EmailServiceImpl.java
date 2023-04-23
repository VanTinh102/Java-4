package com.poly.ps24504.service.impl;

import javax.servlet.ServletContext;

import com.poly.ps24504.entity.User;
import com.poly.ps24504.service.EmailService;
import com.poly.ps24504.util.SendEmailUtil;

public class EmailServiceImpl implements EmailService {

	private static final String EMAIL_WELCOME_SUBJECT = "WELCOME TO HAI.COM";
	private static final String EMAIL_FORGOT_PASSWORD = "HAI.COM - NEW PASSWORD";
	@Override
	public void sendEmail(ServletContext context, User recipient, String type) {
		String host = context.getInitParameter("host");
        String port = context.getInitParameter("port");
        String user = context.getInitParameter("user");
        String pass = context.getInitParameter("pass");
		
        try {
        	String subject = null;
			String content = null;
			
			switch (type) {
			case "welcome":
				subject = EMAIL_WELCOME_SUBJECT;
				content = "Chào " +recipient.getUserName();
				break;
			case "forgot":
				subject = EMAIL_FORGOT_PASSWORD;
				content = "Chào "+ recipient.getUserName() + " your new password: " + recipient.getPassword();
				break;
			default:
				subject = "Hai.com";
				content = "Email is wrong";
				break;
			}
			SendEmailUtil.sendEmail(host, port, user, pass, recipient.getEmail(), subject, content);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
