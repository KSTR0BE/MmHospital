package kr.or.ddit.nurse.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.nurse.vo.NurDiagnosisListVO;
import kr.or.ddit.nurse.vo.NurMemberAdListVO;
import kr.or.ddit.nurse.vo.NurseMediListVO;
import kr.or.ddit.nurse.vo.NurseVO;
import kr.or.ddit.util.MyBatisUtil;

public class NurseDaoImpl implements INurseDao {

	private static INurseDao nurDao = new NurseDaoImpl();

	public NurseDaoImpl() {

	}

	public static INurseDao getInstance() {
		return nurDao;
	}

	@Override
	public NurseVO getNurse(String uId) {
		SqlSession session = MyBatisUtil.getSqlSession(true);

		NurseVO nv = null;

		try {

			nv = session.selectOne("nurse.getNurse", uId);

		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return nv;
	}

	@Override
	public int modifyNurse(NurseVO nsv) {

		SqlSession sqlSession = MyBatisUtil.getSqlSession();

		int cnt = 0;

		try {

			cnt = sqlSession.update("nurse.modifyNurse", nsv);

			if (cnt > 0) {
				sqlSession.commit();
			}

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
	}

	@Override
	public NurseVO nurseDetail(String nsNo) {
		SqlSession session = MyBatisUtil.getSqlSession();

		NurseVO nv = null;

		try {

			nv = session.selectOne("nurse.NurseDetail", nsNo);

		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return nv;
	}

	@Override
	public int nurseUpdate(String nsNo) {
		SqlSession session = MyBatisUtil.getSqlSession();

		int cnt = 0;

		try {
			cnt = session.update("nurse.NurseUpdate", nsNo);
			if (cnt > 0) {
				session.commit();
			}

		} catch (PersistenceException e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}

		return cnt;
	}

	@Override
	public List<NurMemberAdListVO> NursePatientList() {
		// 입원환자 목록
		List<NurMemberAdListVO> memList = new ArrayList<NurMemberAdListVO>();

		SqlSession session = null;

		try {
			session = MyBatisUtil.getSqlSession(true);
			memList = session.selectList("patientList.NursePatientList");

		} catch (PersistenceException e) {
			e.printStackTrace();

		} finally {
			session.close();

		}

		return memList;
	}

	@Override
	public int nurseInsert(NurseVO nv) {
		SqlSession session = MyBatisUtil.getSqlSession(true);

		int cnt = 0;

		try {
			cnt = session.insert("nurse.NurseInsert", nv);
			if (cnt > 0) {
				session.commit();
			}
		} catch (PersistenceException e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}

		return cnt;
	}

	@Override
	public List<NurseMediListVO> NurseMedList() {
		// 입원환자 목록
		List<NurseMediListVO> medList = new ArrayList<NurseMediListVO>();

		SqlSession session = null;

		try {
			session = MyBatisUtil.getSqlSession(true);
			medList = session.selectList("mediList.NurseMedList");

		} catch (PersistenceException e) {
			e.printStackTrace();

		} finally {
			session.close();

		}
		return medList;
	}

	@Override
	public String getMemberPassword(String userId) {
		SqlSession sqlSession = MyBatisUtil.getSqlSession();
		String password = null;
		try {
			password = sqlSession.selectOne("nurse.getNursePassword", userId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return password;
	}



}
