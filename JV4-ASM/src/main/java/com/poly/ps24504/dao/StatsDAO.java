package com.poly.ps24504.dao;

import java.util.List;

import com.poly.ps24504.entity.VideoLikeInfo;

public interface StatsDAO {
	List<VideoLikeInfo> findVideoLikedInfo();
}
