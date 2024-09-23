package kr.or.ddit.notice.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.util.MyBatisUtil;

public class NoticeDaoImpl implements INoticeDao{
	private static INoticeDao ntDao = new NoticeDaoImpl();
	
	private NoticeDaoImpl() {
		
	}
	
	public static INoticeDao getInstance() {
		return ntDao;
	}
	
	@Override
	public List<NoticeVO> ntList(Map<String, Object> map) {
		SqlSession session = MyBatisUtil.getSqlSession();
		
		List<NoticeVO> ntList = null;
		
		try {
//			ntList = session.selectList("nt.ntList", map);
			ntList = session.selectList("nt.ntSearch2", map);
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		
		return ntList;
	}

	@Override
	public NoticeVO ntGet(String ntNo) {
		SqlSession session = MyBatisUtil.getSqlSession(true);
		
		NoticeVO nv = null;
		
		try {
			nv = session.selectOne("nt.ntGet", ntNo);
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		
		return nv;
	}

	@Override
	public int ntInsert(NoticeVO nv) {
		SqlSession session = null;
		
		int cnt = 0;
		
		try {
			session = MyBatisUtil.getSqlSession();
			
			cnt = session.insert("nt.ntInsert", nv);
			
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
	public int ntUpdate(NoticeVO nv) {
		SqlSession session = null;
		
		int cnt = 0;
		
		try {
			session = MyBatisUtil.getSqlSession();
			
			cnt = session.insert("nt.ntUpdate", nv);
			
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
	public int ntDelete(String ntNo) {
		SqlSession session = null;
		
		int cnt = 0;
		
		try {
			session = MyBatisUtil.getSqlSession();
			
			cnt = session.insert("nt.ntDelete", ntNo);
			
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
	public int ntHit(String ntNo) {
		SqlSession session = null;
		
		int cnt = 0;
		
		try {
			session = MyBatisUtil.getSqlSession();
			
			cnt = session.insert("nt.ntHit", ntNo);
			
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
	public List<NoticeVO> ntSearch(Map<String, Object> map) {
		SqlSession session = MyBatisUtil.getSqlSession();
		
		List<NoticeVO> ntList = null;
		
		try {
			ntList = session.selectList("nt.ntSearch", map);
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		
		return ntList;
	}

	@Override
	public int countList() {
		SqlSession session = MyBatisUtil.getSqlSession();
		
		int countAll = 0;
		
		try {
			countAll = session.selectOne("nt.countList");
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		
		return countAll;
	}

	@Override
	public int countList2(String ntTit) {
		SqlSession session = MyBatisUtil.getSqlSession();
		
		int countAll = 0;
		
		try {
			countAll = session.selectOne("nt.countList2", ntTit);
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		
		return countAll;
	}

}
