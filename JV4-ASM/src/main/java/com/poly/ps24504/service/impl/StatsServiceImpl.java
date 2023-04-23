package com.poly.ps24504.service.impl;

import java.util.List;

import com.poly.ps24504.dao.StatsDAO;
import com.poly.ps24504.dao.StatsDAOImpl;
import com.poly.ps24504.entity.VideoLikeInfo;
import com.poly.ps24504.service.StatsService;

public class StatsServiceImpl  implements StatsService {

	private StatsDAO statsDAO;
	public StatsServiceImpl() {
		statsDAO = new StatsDAOImpl();
	}

	@Override
	public List<VideoLikeInfo> findVideoLikedInfo() {
		// TODO Auto-generated method stub
		return statsDAO.findVideoLikedInfo();
	}

}
