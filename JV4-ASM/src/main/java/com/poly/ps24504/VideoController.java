package com.poly.ps24504;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.ps24504.contant.SessionAttribute;
import com.poly.ps24504.entity.History;
import com.poly.ps24504.entity.User;
import com.poly.ps24504.entity.Video;
import com.poly.ps24504.service.HistoryService;
import com.poly.ps24504.service.VideoService;
import com.poly.ps24504.service.impl.HistoryServiceImpl;
import com.poly.ps24504.service.impl.VideoServiceImpl;

/**
 * Servlet implementation class VideoController
 */
@WebServlet("/video")
public class VideoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private VideoService videoService = new VideoServiceImpl();
	private HistoryService historyService = new HistoryServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String actionParam = request.getParameter("action");
		String href = request.getParameter("id");
		HttpSession session = request.getSession();
		if(actionParam.contains("watch")) {
			this.doGetWatch(session, href, request, response);
		}else if(actionParam.contains("like")) {
			this.doGetLike(session, href, request, response);
		}
	}
	private void doGetWatch(HttpSession session, String href, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Video video = videoService.findByHref(href);
		request.setAttribute("video", video);
		User currentUser = (User) session.getAttribute(SessionAttribute.CURRENT_USER);
		if(currentUser != null) {
			History history = historyService.create(currentUser, video);
			request.setAttribute("flagLikeBtn", history.getIsLiked());
		}
		
		request.getRequestDispatcher("/view/video-detail.jsp").forward(request, response);
	}
	private void doGetLike(HttpSession session, String href, HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("application/json"); //ajax nhận trả data dạng json
		User currentUser = (User) session.getAttribute(SessionAttribute.CURRENT_USER);
		boolean result = historyService.updateLikeOrDislike(currentUser, href);
		if(result == true) {
			response.setStatus(204); //success no respond data
		}else {
			response.setStatus(400);
		}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
