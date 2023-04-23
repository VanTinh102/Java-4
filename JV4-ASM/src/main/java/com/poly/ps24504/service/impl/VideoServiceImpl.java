package com.poly.ps24504.service.impl;

import java.util.List;

import com.poly.ps24504.dao.VideoDao;
import com.poly.ps24504.dao.VideoDaoImpl;
import com.poly.ps24504.entity.Video;
import com.poly.ps24504.service.VideoService;

public class VideoServiceImpl implements VideoService {
	private VideoDao dao;

	public VideoServiceImpl() {
		dao = new VideoDaoImpl();
	}

	@Override
	public Video findByID(Integer id) {
		// TODO Auto-generated method stub
		return dao.findByID(id);
	}

	@Override
	public Video findByHref(String href) {
		// regex
		return dao.findByHref(href);
	}

	@Override
	public List<Video> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}

	@Override
	public List<Video> findAll(int pageNumber, int pageSize) {
		return dao.findAll(pageNumber, pageSize);
	}

	@Override
	public Video create(Video entity) {
		entity.setIsActive(Boolean.TRUE);
		entity.setViews(0);
		entity.setShare(0);
		return dao.create(entity);
	}

	@Override
	public Video update(Video entity) {
		return dao.update(entity);
	}

	@Override
	public Video delete(String href) {
		Video entity = findByHref(href);
		entity.setIsActive(Boolean.FALSE);
		return dao.update(entity);
	}
}
