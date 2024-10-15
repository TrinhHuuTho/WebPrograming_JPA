package vn.iotstar.dao.impl;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import vn.iotstar.dao.IVideoDao;
import vn.iotstar.entity.Video;
import vn.iotstar.config.JPAConfig;

public class VideoDao implements IVideoDao {
	@Override
	public List<Video> findAll() {
		EntityManager enma = JPAConfig.getEntityManager();
		TypedQuery<Video> query = enma.createQuery("SELECT v FROM Video v", Video.class); // Truy vấn tất cả video
		return query.getResultList();
	}

	@Override
	public Video findById(String videoId) {
		EntityManager enma = JPAConfig.getEntityManager();
		Video video = enma.find(Video.class, videoId); // Tìm video theo ID
		return video;
	}

	@Override
	public void insert(Video video) {
		EntityManager enma = JPAConfig.getEntityManager();
		EntityTransaction trans = enma.getTransaction();
		try {
			trans.begin();
			enma.persist(video); // Insert video vào cơ sở dữ liệu
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			throw e;
		} finally {
			enma.close();
		}
	}

	@Override
	public void update(Video video) {
		EntityManager enma = JPAConfig.getEntityManager();
		EntityTransaction trans = enma.getTransaction();
		try {
			trans.begin();
			enma.merge(video); // Cập nhật video trong cơ sở dữ liệu
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			throw e;
		} finally {
			enma.close();
		}
	}

	@Override
	public void delete(String videoId) throws Exception {
		EntityManager enma = JPAConfig.getEntityManager();
		EntityTransaction trans = enma.getTransaction();
		try {
			trans.begin();
			Video video = enma.find(Video.class, videoId);
			if (video != null) {
				enma.remove(video); // Xóa video khỏi cơ sở dữ liệu
			} else {
				throw new Exception("Không tìm thấy video với ID: " + videoId);
			}
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			throw e;
		} finally {
			enma.close();
		}
	}

}