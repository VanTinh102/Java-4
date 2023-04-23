package com.poly.ps24504.service;

import java.util.List;

import com.poly.ps24504.entity.History;
import com.poly.ps24504.entity.User;
import com.poly.ps24504.entity.Video;

public interface HistoryService {
	List<History> findByUser(String username);
	List<History> findByUserAndIsLiked(String username);
	History findByUserIdAndVideoId(Integer userId, Integer videoId);
	History create(User user, Video video);
	boolean updateLikeOrDislike(User user, String videoHref);

}
