package com.poly.ps24504.dao;

import java.util.List;

import com.poly.ps24504.entity.History;

public class HistoryDaoImpl extends AbstractDao<History> implements HistoryDao {

	@Override
	public List<History> findByUser(String username) {
		// TODO Auto-generated method stub
		String jpql = "Select o from History o WHERE o.user.userName = ?0 and o.video.isActive = 1"
			+ " order by o.viewedDate desc";
		return super.findMany(History.class, jpql, username);
	}

	@Override
	public List<History> findByUserAndIsLiked(String username) {
		String jpql = "Select o from History o WHERE o.user.userName = ?0 and o.isLiked = 1 and o.video.isActive = 1"
				+ " order by o.viewedDate desc";
			return super.findMany(History.class, jpql, username);
	}

	@Override
	public History findByUserIdAndVideoId(Integer userId, Integer videoId) {
		String jpql = "Select o from History o WHERE o.user.id = ?0 and o.video.id = ?1";
		return super.findOne(History.class, jpql, userId, videoId);
	}
	
	

}
