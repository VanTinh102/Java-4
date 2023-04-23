package com.poly.ps24504.dao;

import java.util.List;

import com.poly.ps24504.entity.History;

public interface HistoryDao {
	List<History> findByUser(String username);
	List<History> findByUserAndIsLiked(String username);
	History findByUserIdAndVideoId(Integer userId, Integer videoId);
	History create(History entity);
	History update(History entity);
	History delete(History entity);
}
