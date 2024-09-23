package kr.or.ddit.appointMent.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.appointMent.vo.AppointMentVO;
import kr.or.ddit.appointMent.vo.DiagnosisVO;
import kr.or.ddit.doctor.vo.DoctorVO;
import kr.or.ddit.util.MyBatisUtil;

public class AppointmentDaoImpl implements IAppointmentDao {
	private static IAppointmentDao amDao = new AppointmentDaoImpl();
	
	private AppointmentDaoImpl() {
		
	}
	
	public static IAppointmentDao getInstance() {
		return amDao;
	}

	@Override
	public int insertAppoint(AppointMentVO apmVO) {
	SqlSession session = null;
		
		int cnt = 0;
		
		try {
			session = MyBatisUtil.getSqlSession();
			
			cnt = session.insert("appointMent.amInsert", apmVO);
			
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
	public AppointMentVO appointRecord(int no) {
		SqlSession session = null;
		
		AppointMentVO am = new AppointMentVO();
		
		try {
			session = MyBatisUtil.getSqlSession();
			
			am = session.selectOne("appointMent.amRecord", no);
		
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		
		return am;
	}

	@Override
	public List<DiagnosisVO> appointData(int no) {
		SqlSession session = null;
		
		List<DiagnosisVO> dg = null;
		
		try {
			session = MyBatisUtil.getSqlSession();
			
			dg = session.selectList("appointMent.amData", no);
		
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		
		return dg;
	}

	@Override
	public int appointDelete(int no) {
		SqlSession session = null;
		
		int cnt =0;
		
		try {
			session = MyBatisUtil.getSqlSession();
			
			cnt = session.delete("appointMent.amDelete", no);
		
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
	public List<DiagnosisVO> DgSearch(Map<String, Object> paramMap) {
		SqlSession session = null;
		
		List<DiagnosisVO> dg = null;
		
		try {
			session = MyBatisUtil.getSqlSession();
			
			dg = session.selectList("appointMent.dgSearch",paramMap);
		
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		
		return dg;
	}


	@Override
	public List<DoctorVO> searchDoctor(int cl_no) {
		SqlSession session = null;
		
		List<DoctorVO> dt = null;
		
		try {
			session = MyBatisUtil.getSqlSession();
			
			dt = session.selectList("doctor.AppointGetDoctor", cl_no);
		
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		
		return dt;
	}


	@Override
	public AppointMentVO amChk(AppointMentVO apmVO) {
		SqlSession session = MyBatisUtil.getSqlSession();
			
		AppointMentVO am = new AppointMentVO();
		
		try {
			am = session.selectOne("appointMent.amChk", apmVO);
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		
		return am;
	}

	@Override
	public AppointMentVO amChk1(AppointMentVO apmVO) {
		SqlSession session = MyBatisUtil.getSqlSession();
		
		AppointMentVO am = new AppointMentVO();
		
		try {
			am = session.selectOne("appointMent.amChk1", apmVO);
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		
		return am;
	}
	
	
}
