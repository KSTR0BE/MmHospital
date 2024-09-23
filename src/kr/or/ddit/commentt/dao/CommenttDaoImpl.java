package kr.or.ddit.commentt.dao;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.commentt.vo.CommenttVO;
import kr.or.ddit.util.MyBatisUtil;

public class CommenttDaoImpl implements ICommenttDao{
	private static ICommenttDao cmDao = new CommenttDaoImpl();
	
	private CommenttDaoImpl() {
		
	}
	
	public static ICommenttDao getInstance() {
		return cmDao;
	}

	@Override
	public int cmInsert(CommenttVO cv) {
		SqlSession session = MyBatisUtil.getSqlSession();
		
		int cnt = 0;
		
		try {
			cnt = session.insert("cm.cmInsert", cv);
			
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
	public CommenttVO cmGet(String sgNo) {
		SqlSession session = MyBatisUtil.getSqlSession();
		
		CommenttVO cv = null;
		try {
			cv = session.selectOne("cm.cmGet", sgNo);
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return cv;
	}

	@Override
	public int cmUpdate(CommenttVO cv) {
		SqlSession session = MyBatisUtil.getSqlSession();
		
		int cnt = 0;
		
		try {
			cnt = session.insert("cm.cmUpdate", cv);
			
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
	public int cmDelete(String sgNo) {
		SqlSession session = MyBatisUtil.getSqlSession();
		
		int cnt = 0;
		
		try {
			cnt = session.insert("cm.cmDelete", sgNo);
			
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
	
}
