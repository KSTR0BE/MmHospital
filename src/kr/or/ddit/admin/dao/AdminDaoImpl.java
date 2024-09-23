package kr.or.ddit.admin.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.admin.vo.AdminVO;
import kr.or.ddit.doctor.vo.DoctorVO;
import kr.or.ddit.nurse.vo.NurseVO;
import kr.or.ddit.util.MyBatisUtil;

public class AdminDaoImpl implements IAdminDao{
	private static IAdminDao adDao = new AdminDaoImpl();
	
	public AdminDaoImpl() {
		
	}
	
	public static IAdminDao getInstance() {
		return adDao;
	}
	
	
	@Override
	public AdminVO adGet(String adId) {
		SqlSession session = MyBatisUtil.getSqlSession(true);
		
		AdminVO av = null;
		
		try {
			av = session.selectOne("ad.adGet", adId);
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		
		return av;
	}

	@Override
	public List<DoctorVO> AdDoctorList() {
		
		SqlSession session = MyBatisUtil.getSqlSession(true);

		List<DoctorVO> dcList = new ArrayList<DoctorVO>();
		try {
			dcList = session.selectList("doctor.DoctorList");
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return dcList;
	}

	@Override
	public List<NurseVO> AdNurseList() {
		SqlSession session = MyBatisUtil.getSqlSession(true);
		
		List<NurseVO> nsList = new ArrayList<NurseVO>();
		
		try {
			nsList = session.selectList("nurse.NurseList");
			
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return nsList;
	}
	
}
