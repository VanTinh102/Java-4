package com.poly.ps24504;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.ps24504.contant.SessionAttribute;
import com.poly.ps24504.entity.User;
import com.poly.ps24504.service.EmailService;
import com.poly.ps24504.service.UserService;
import com.poly.ps24504.service.impl.EmailServiceImpl;
import com.poly.ps24504.service.impl.UserServiceImpl;

/**
 * Servlet implementation class UserController
 */
@WebServlet({"/login", "/logout", "/register", "/forgotPass", "/changePass"})
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserService userService = new UserServiceImpl();
    private EmailService emailService = new EmailServiceImpl();
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String uri = request.getRequestURI();
		if(uri.contains("login")) {
			this.doGetLogin(request, response);
		}else if(uri.contains("register")) {
			this.doGetRegister(request, response);
		}else if(uri.contains("logout")) {
			this.doGetLogout(session, request, response);
		}else if(uri.contains("forgotPass")) {
			this.doGetForgotPass(session, request, response);
		}
	}
	private void doGetLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/view/login.jsp").forward(request, response);
	}
	private void doGetRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/view/register.jsp").forward(request, response);
	}
	private void doGetLogout(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session.removeAttribute(SessionAttribute.CURRENT_USER);
		response.sendRedirect("index");
	}
	private void doGetForgotPass(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/view/forgot-pass.jsp").forward(request, response);
	}

	//////doPost///////
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String uri = request.getRequestURI();
		if(uri.contains("login")) {
			this.doPostLogin(session, request, response);
		}else if(uri.contains("register")) {
			this.doPostRegister(session, request, response);
		}else if(uri.contains("forgotPass")) {
			this.doPostForgotPass(request, response);
		}else if(uri.contains("changePass")) {
			this.doPostChangePass(session, request, response);
		}
		
	}
	
	private void doPostLogin(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User user = userService.login(username, password);
		if(user != null) {
			session.setAttribute(SessionAttribute.CURRENT_USER, user);
			response.sendRedirect("index");
		}else {
			response.sendRedirect("login");
		}
	}
	private void doPostRegister(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		User user = userService.register(username, password, email);
		if(user != null) {
			emailService.sendEmail(getServletContext(), user, "welcome");
			session.setAttribute(SessionAttribute.CURRENT_USER, user);
			response.sendRedirect("index");
		}else {
			response.sendRedirect("register");
		}
	}
	private void doPostForgotPass( HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("application/json"); //ajax nhận trả data dạng json
		String email = request.getParameter("email");
		User userWithNewPass = userService.resetPassword(email);
		if(userWithNewPass != null) {
			emailService.sendEmail(getServletContext(), userWithNewPass, "forgot");
			response.setStatus(204);
		}else {
			response.setStatus(400);
		}
	}
	private void doPostChangePass(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("application/json"); //ajax nhận trả data dạng json
		String currentPass = request.getParameter("currentPass");
		String newPass = request.getParameter("newPass");
		User currentUser = (User) session.getAttribute(SessionAttribute.CURRENT_USER);
		if(currentUser.getPassword().equals(currentPass)) {
			currentUser.setPassword(newPass);
			User updateUser = userService.update(currentUser);
			if(updateUser != null) {
				session.setAttribute(SessionAttribute.CURRENT_USER, updateUser);
				response.setStatus(204);
			}else {
				response.setStatus(400);
			}
		}else {
			response.setStatus(400);
		}
	}

}
