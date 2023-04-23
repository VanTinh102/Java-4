package com.poly.ps24504.service;

import java.util.List;

import com.poly.ps24504.entity.VideoLikeInfo;

public interface StatsService {
	List<VideoLikeInfo> findVideoLikedInfo();
}
