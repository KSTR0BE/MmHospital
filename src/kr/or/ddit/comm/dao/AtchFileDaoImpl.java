package kr.or.ddit.comm.dao;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.comm.vo.AtchFileDetailVO;
import kr.or.ddit.comm.vo.AtchFileVO;
import kr.or.ddit.util.MyBatisUtil;

public class AtchFileDaoImpl implements IAtchFileDao{
	private static IAtchFileDao fileDao = new AtchFileDaoImpl();
	
	private AtchFileDaoImpl() {
		
	}
	
	public static IAtchFileDao getInstance() {
		return fileDao;
	}

	@Override
	public int insertAtchFile(AtchFileVO atchFileVO) {
		SqlSession session = MyBatisUtil.getSqlSession();
		
		int cnt = 0;
		
		try {
			cnt = session.insert("atchFile.insertAtchFile", atchFileVO);
			
			if(cnt > 0)
				session.commit();
		}catch(PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public int insertAtchFileDetail(AtchFileDetailVO atchFileDetailVO) {
		SqlSession session = MyBatisUtil.getSqlSession();
		
		int cnt = 0;
		
		try {
			cnt = session.insert("atchFile.insertAtchFileDetail", atchFileDetailVO);
			
			if(cnt > 0)
				session.commit();
		}catch(PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public AtchFileVO getAtchFile(AtchFileVO atchFileVO) {
		SqlSession session = MyBatisUtil.getSqlSession(true);
		
		try {
			atchFileVO = session.selectOne("atchFile.getAtchFile", atchFileVO);
		}catch(PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return atchFileVO;
	}

	@Override
	public AtchFileDetailVO getAtchFileDetail(AtchFileDetailVO atchFileDetailVO) {
		SqlSession session = MyBatisUtil.getSqlSession(true);
		
		try {
			atchFileDetailVO = session.selectOne("atchFile.getAtchFileDetail", atchFileDetailVO);
		}catch(PersistenceException ex) {
			session.rollback();
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return atchFileDetailVO;
	}
	
}
