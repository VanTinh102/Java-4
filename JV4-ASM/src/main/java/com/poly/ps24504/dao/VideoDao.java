package com.poly.ps24504.dao;

import java.util.List;

import com.poly.ps24504.entity.User;
import com.poly.ps24504.entity.Video;

public interface VideoDao {
	Video findByID(Integer id);
	Video findByHref(String href);
	List<Video> findAll();
	List<Video> findAll(int pageNumber, int pageSize);
	Video create(Video entity);
	Video update(Video entity);
	Video delete(Video entity);
}
