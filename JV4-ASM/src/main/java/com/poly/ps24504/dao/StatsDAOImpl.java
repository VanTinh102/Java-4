package com.poly.ps24504.dao;

import java.util.ArrayList;
import java.util.List;

import com.poly.ps24504.entity.VideoLikeInfo;

public class StatsDAOImpl extends AbstractDao<Object[]> implements StatsDAO {

	@Override
	public List<VideoLikeInfo> findVideoLikedInfo() {
		String sql = " select v.id, v.title, v.href, sum(cast(h.isLiked as int)) as totalLike"
				+ " from VIDEOS v left join HISTORY h on v.id = h.videoID"
				+ " where v.isActive = 1"
				+ " group by v.id, v.title, v.href"
				+ " order by sum(cast(h.isLiked as int)) DESC";
		
		List<Object[]> objects = super.findManyByNativeQuery(sql);
		List<VideoLikeInfo> result = new ArrayList<>();
		objects.forEach(object -> {
			VideoLikeInfo videoLikedInfo = setDataVideoLikedInfo(object);
			result.add(videoLikedInfo);
		});
		return result;
	}
	
	private VideoLikeInfo setDataVideoLikedInfo(Object[] object) {
		VideoLikeInfo videoLikedInfo = new VideoLikeInfo();
		videoLikedInfo.setVideoID((Integer)object[0]);
		videoLikedInfo.setTitle((String) object[1]);
		videoLikedInfo.setHref((String) object[2]);
		videoLikedInfo.setTotalLike(object[3] == null ? 0 : (Integer) object[3]);
		return videoLikedInfo;
	}

}
