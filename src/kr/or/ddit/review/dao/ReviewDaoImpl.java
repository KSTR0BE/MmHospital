package kr.or.ddit.review.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.review.vo.ReviewVO;
import kr.or.ddit.util.MyBatisUtil;

public class ReviewDaoImpl implements IReviewDao{
	private static IReviewDao rvDao = new ReviewDaoImpl();
	
	private ReviewDaoImpl() {
		
	}
	
	public static IReviewDao getInstance() {
		return rvDao;
	}
	
	
	@Override
	public List<ReviewVO> rvList(Map<String, Object> map) {
		SqlSession session = MyBatisUtil.getSqlSession();
		
		List<ReviewVO> rvList = null;
		
		try {
//			rvList = session.selectList("rv.rvList", map);
			rvList = session.selectList("rv.rvSearch2", map);
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		
		return rvList;
	}
	
	@Override
	public ReviewVO rvGet(String rvNo) {
		SqlSession session = MyBatisUtil.getSqlSession(true);
		
		ReviewVO rv = null;
		
		try {
			rv = session.selectOne("rv.rvGet", rvNo);
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return rv;
	}

	@Override
	public int rvInsert(ReviewVO rv) {
		SqlSession session = null;
		
		int cnt = 0;
		
		try {
			session = MyBatisUtil.getSqlSession();
			
			cnt = session.insert("rv.rvInsert", rv);
			
			if(cnt > 0) {
				session.commit();
			}
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		
		return cnt;
	}

	@Override
	public int rvUpdate(ReviewVO rv) {
		SqlSession session = null;
		
		int cnt = 0;
		
		try {
			session = MyBatisUtil.getSqlSession();
			
			cnt = session.insert("rv.rvUpdate", rv);
			
			if(cnt > 0) {
				session.commit();
			}
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public int rvDelete(String rvNo) {
		SqlSession session = null;
		
		int cnt = 0;
		
		try {
			session = MyBatisUtil.getSqlSession();
			
			cnt = session.insert("rv.rvDelete", rvNo);
			
			if(cnt > 0) {
				session.commit();
			}
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		
		return cnt;
	}

	@Override
	public int rvHit(String rvNo) {
		SqlSession session = null;
		
		int cnt = 0;
		
		try {
			session = MyBatisUtil.getSqlSession();
			
			cnt = session.insert("rv.rvHit", rvNo);
			
			if(cnt > 0) {
				session.commit();
			}
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public List<ReviewVO> rvSearch(String rvTit) {
		List<ReviewVO> rvList = new ArrayList<ReviewVO>();
		
		SqlSession session = null;
		
		try {
			session = MyBatisUtil.getSqlSession(true);
			
			rvList = session.selectList("rv.rvSearch", rvTit);
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		
		return rvList;	
	}

	@Override
	public int countList() {
		SqlSession session = MyBatisUtil.getSqlSession();
		
		int countAll = 0;
		
		try {
			countAll = session.selectOne("rv.countList");
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		
		return countAll;
	}

	@Override
	public int countList2(String rvTit) {
		SqlSession session = MyBatisUtil.getSqlSession();
		
		int countAll = 0;
		
		try {
			countAll = session.selectOne("rv.countList2", rvTit);
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		
		return countAll;
	}
	
}
