package vn.iotstar.services.impl;

import java.util.List;

import vn.iotstar.dao.impl.VideoDao;
import vn.iotstar.entity.Video;
import vn.iotstar.services.IVideoService;

public class VideoServiceImpl implements IVideoService {
	private VideoDao videoDao = new VideoDao();

	@Override
	public List<Video> findAll() {
		return videoDao.findAll();
	}

	@Override
	public Video findById(String videoId) {
		return videoDao.findById(videoId);
	}

	@Override
	public void insert(Video video) {
		videoDao.insert(video);

	}

	@Override
	public void update(Video video) {
		videoDao.update(video);

	}

	@Override
	public void delete(String videoId) throws Exception {
		videoDao.delete(videoId);

	}

}