package com.poly.ps24504.dao;

import java.util.List;

import com.poly.ps24504.entity.User;
import com.poly.ps24504.entity.Video;

public class VideoDaoImpl extends AbstractDao<Video> implements VideoDao{

	@Override
	public Video findByID(Integer id) {
		// TODO Auto-generated method stub
		return super.findByID(Video.class, id);
	}

	@Override
	public Video findByHref(String href) {
		String jpql = "Select o from Video o where o.href = ?0";
		return super.findOne(Video.class, jpql, href);
	}

	@Override
	public List<Video> findAll() {
		return super.findAll(Video.class,true);
	}

	@Override
	public List<Video> findAll(int pageNumber, int pageSize) {
		return super.findAll(Video.class, true, pageNumber, pageSize);
	}
}
