package com.poly.ps24504.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "VIDEOS")
public class Video {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String title;
	private String href;
	private String poster;
	@Column(name = "`views`")
	private Integer views;
	private Integer share;
	private String description;
	private Boolean isActive;
	@OneToMany(mappedBy = "video")
	List<History> histories;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getHref() {
		return href;
	}
	public void setHref(String href) {
		this.href = href;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public Integer getViews() {
		return views;
	}
	public void setViews(Integer views) {
		this.views = views;
	}
	public Integer getShare() {
		return share;
	}
	public void setShare(Integer share) {
		this.share = share;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Boolean getIsActive() {
		return isActive;
	}
	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}
	public List<History> getHistories() {
		return histories;
	}
	public void setHistories(List<History> histories) {
		this.histories = histories;
	}
	
	

}
