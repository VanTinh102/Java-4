package com.poly.ps24504.service.impl;

import java.sql.Timestamp;
import java.util.List;

import com.poly.ps24504.dao.HistoryDao;
import com.poly.ps24504.dao.HistoryDaoImpl;
import com.poly.ps24504.entity.History;
import com.poly.ps24504.entity.User;
import com.poly.ps24504.entity.Video;
import com.poly.ps24504.service.HistoryService;
import com.poly.ps24504.service.VideoService;

public class HistoryServiceImpl implements HistoryService  {
	private HistoryDao dao;
	private VideoService videoService = new VideoServiceImpl();
	
	
	public HistoryServiceImpl() {
		dao = new HistoryDaoImpl();
	}

	@Override
	
	public List<History> findByUser(String username) {
		// TODO Auto-generated method stub
		return dao.findByUser(username);
	}

	@Override
	public List<History> findByUserAndIsLiked(String username) {
		// TODO Auto-generated method stub
		return dao.findByUserAndIsLiked(username);
	}

	@Override
	public History findByUserIdAndVideoId(Integer userId, Integer videoId) {
		// TODO Auto-generated method stub
		return dao.findByUserIdAndVideoId(userId, videoId);
	}

	@Override
	public History create(User user, Video video) {
		History exitsHistory = findByUserIdAndVideoId(user.getId(), video.getId());
		if(exitsHistory == null) {
			exitsHistory = new History();
			exitsHistory.setUser(user);
			exitsHistory.setVideo(video);
			exitsHistory.setViewedDate(new Timestamp(System.currentTimeMillis()));
			exitsHistory.setIsLiked(Boolean.FALSE);
			return dao.create(exitsHistory);
		}
		return exitsHistory;
	}

	@Override
	public boolean updateLikeOrDislike(User user, String videoHref) {
		Video video = videoService.findByHref(videoHref);
		History existHistory = findByUserIdAndVideoId(user.getId(), video.getId());
		if(existHistory.getIsLiked() == Boolean.FALSE) {
			existHistory.setIsLiked(Boolean.TRUE);
			existHistory.setLikeDate(new Timestamp(System.currentTimeMillis()));
		}else {
			existHistory.setIsLiked(Boolean.FALSE);
			existHistory.setLikeDate(null);
		}
		History updateHistory = dao.update(existHistory);
		return updateHistory != null ? true:false;
	}

}
