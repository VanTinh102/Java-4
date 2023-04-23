package com.poly.ps24504.entity;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.hibernate.annotations.CreationTimestamp;
@Entity
@Table(name = "HISTORY", uniqueConstraints = {@UniqueConstraint( columnNames = {"videoID","userID"} )} )
public class History {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@ManyToOne @JoinColumn(name = "userID")
	private User user;
	@ManyToOne @JoinColumn(name = "videoID")
	private Video video;
	@CreationTimestamp //auto lấy thời gian hệ thống (likeDate ko cần)
	private Timestamp viewedDate;
	private Boolean isLiked;	
	private Timestamp likeDate;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Video getVideo() {
		return video;
	}
	public void setVideo(Video video) {
		this.video = video;
	}
	public Timestamp getViewedDate() {
		return viewedDate;
	}
	public void setViewedDate(Timestamp viewedDate) {
		this.viewedDate = viewedDate;
	}
	public Boolean getIsLiked() {
		return isLiked;
	}
	public void setIsLiked(Boolean isLiked) {
		this.isLiked = isLiked;
	}
	public Timestamp getLikeDate() {
		return likeDate;
	}
	public void setLikeDate(Timestamp likeDate) {
		this.likeDate = likeDate;
	}
	
	
}
