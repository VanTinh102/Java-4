package com.poly.ps24504;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.ps24504.contant.SessionAttribute;
import com.poly.ps24504.dao.AbstractDao;
import com.poly.ps24504.dao.UserDaoImpl;
import com.poly.ps24504.entity.History;
import com.poly.ps24504.entity.User;
import com.poly.ps24504.entity.Video;
import com.poly.ps24504.entity.VideoLikeInfo;
import com.poly.ps24504.service.HistoryService;
import com.poly.ps24504.service.StatsService;
import com.poly.ps24504.service.VideoService;
import com.poly.ps24504.service.impl.HistoryServiceImpl;
import com.poly.ps24504.service.impl.StatsServiceImpl;
import com.poly.ps24504.service.impl.VideoServiceImpl;
import com.poly.ps24504.util.JavaUtil;

/**
 * Servlet implementation class ASM
 */
@WebServlet({"/index", "/favorite", "/history", "/adminVideo" , "/adminUser" , "/adminReport"})
public class ASM extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    private VideoService videoService = new VideoServiceImpl();
    private HistoryService historyService = new HistoryServiceImpl();
    private StatsService statsService = new StatsServiceImpl();
    private static final int VIDEO_MAX_PAGESIZE = 6;
    private UserDaoImpl daoImpl = new UserDaoImpl();
    AbstractDao<Object[]> dao = new AbstractDao<>();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String uri = request.getRequestURI();
		if(uri.contains("index")) {
			this.doGetIndex(request, response);
		}else if(uri.contains("favorite")) {
			this.doGetFavorite(session, request, response);
		}else if(uri.contains("history")) {
			this.doGetHistory(session, request, response);
		}else if(uri.contains("adminVideo")) {
			this.doGetAdminVideo( request, response);
		}else if(uri.contains("adminUser")) {
			this.doGetAdminUser( request, response);
		}else if(uri.contains("adminReport")) {
			this.doGetAdminReport( request, response);
		}
		
	}

	private void doGetAdminReport(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/view/adminReport.jsp").forward(request, response);
	}

	private void doGetAdminUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<User> users = daoImpl.findAll();
		request.setAttribute("users", users);
		request.getRequestDispatcher("/view/adminUser.jsp").forward(request, response);
	}

	private void doGetAdminVideo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<VideoLikeInfo> videos = statsService.findVideoLikedInfo();
		request.setAttribute("videos", videos);
		request.getRequestDispatcher("/view/adminVideo.jsp").forward(request, response);
	}

	private void doGetHistory(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		User user = (User) session.getAttribute(SessionAttribute.CURRENT_USER);
		List<History> histories = historyService.findByUser(user.getUserName());
		List<Video> videos = new ArrayList<>();
		histories.forEach(item -> videos.add(item.getVideo()));
		request.setAttribute("videos", videos);
		request.getRequestDispatcher("/view/history.jsp").forward(request, response);		
	}

	private void doGetFavorite(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		User user = (User) session.getAttribute(SessionAttribute.CURRENT_USER);
		List<History> histories = historyService.findByUserAndIsLiked(user.getUserName());
		List<Video> videos = new ArrayList<>();
		histories.forEach(item -> videos.add(item.getVideo()));
		
		request.setAttribute("videos", videos);
		request.getRequestDispatcher("/view/favorite.jsp").forward(request, response);
	}

	private void doGetIndex(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute(SessionAttribute.CURRENT_USER);
		if(user != null && user.getIsADMIN() == Boolean.TRUE) {
			List<Video> countVideo = videoService.findAll();
			int maxPage = (int) Math.ceil(countVideo.size()/(double)VIDEO_MAX_PAGESIZE); // int chia int tự làm tròn xuống lun
			request.setAttribute("maxPage", maxPage);
			List<Video> videos;
			String pageNumber = request.getParameter("page");
			if(pageNumber == null || Integer.valueOf(pageNumber) > maxPage) {
				videos = videoService.findAll(1, VIDEO_MAX_PAGESIZE);
				request.setAttribute("currentPage", 1);
			}else {
				videos = videoService.findAll(Integer.valueOf(pageNumber), VIDEO_MAX_PAGESIZE);
				request.setAttribute("currentPage", Integer.valueOf(pageNumber));
			}
			
			request.setAttribute("videos", videos);
			request.getRequestDispatcher("/view/index1.jsp").forward(request, response);
		}else {
			List<Video> countVideo = videoService.findAll();
			int maxPage = (int) Math.ceil(countVideo.size()/(double)VIDEO_MAX_PAGESIZE); // int chia int tự làm tròn xuống lun
			request.setAttribute("maxPage", maxPage);
			List<Video> videos;
			String pageNumber = request.getParameter("page");
			if(pageNumber == null || Integer.valueOf(pageNumber) > maxPage) {
				videos = videoService.findAll(1, VIDEO_MAX_PAGESIZE);
				request.setAttribute("currentPage", 1);
			}else {
				videos = videoService.findAll(Integer.valueOf(pageNumber), VIDEO_MAX_PAGESIZE);
				request.setAttribute("currentPage", Integer.valueOf(pageNumber));
			}
			
			request.setAttribute("videos", videos);
			request.getRequestDispatcher("/view/index.jsp").forward(request, response);
		}
		
		
	}


}
