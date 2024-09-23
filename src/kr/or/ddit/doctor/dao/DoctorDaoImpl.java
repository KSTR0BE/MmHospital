package kr.or.ddit.doctor.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.appointMent.vo.AppointMentVO;
import kr.or.ddit.doctor.vo.AdmissionVO;
import kr.or.ddit.doctor.vo.ClassVO;
import kr.or.ddit.doctor.vo.DiagnosisInsertVO;
import kr.or.ddit.doctor.vo.DiagnosisVO;
import kr.or.ddit.doctor.vo.DiseaseVO;
import kr.or.ddit.doctor.vo.DoctorVO;
import kr.or.ddit.doctor.vo.MedicienVO;
import kr.or.ddit.nurse.vo.NurseVO;
import kr.or.ddit.util.MyBatisUtil;

public class DoctorDaoImpl implements IDoctorDao {
	private static IDoctorDao docDao = new DoctorDaoImpl();
	
	public DoctorDaoImpl() {
		
	}
	public static IDoctorDao getInstance() {
		return docDao;
	}
	
	@Override
	public DoctorVO getDoctor(String uId) {
		
		SqlSession session = MyBatisUtil.getSqlSession(true);
		
		DoctorVO dv = null;
		
		try {
			
			dv= session.selectOne("doctor.getDoctor",uId);
			
			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return dv;
	}
	
	@Override
	public int modifyDoctor(DoctorVO dv) {
		SqlSession sqlSession = MyBatisUtil.getSqlSession();
		
		int cnt = 0;
		
		try {
			cnt = sqlSession.update("doctor.modifyDoctor", dv);
			
			if(cnt > 0) {
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
	public List<DiagnosisVO> doctorDnList() {
		
		List<DiagnosisVO> dnList = new ArrayList<DiagnosisVO>();
		
		SqlSession session = null;
		
		try {
			session = MyBatisUtil.getSqlSession(true);
			
			dnList = session.selectList("diagnosis.DoctorDnList");
		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return dnList;
	}
	@Override
	public DoctorVO doctorDetail(String dtNo) {
		SqlSession session = MyBatisUtil.getSqlSession(true);
		
		DoctorVO dv = null;
		
		try {
			dv = session.selectOne("doctor.DoctorDetail", dtNo);
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return dv;
		
	}
	@Override
	public int doctorUpdate(String dtNo) {
		SqlSession session = MyBatisUtil.getSqlSession(true);
		
		int cnt = 0;
		
		try {
			cnt = session.update("doctor.DoctorUpdate", dtNo);
			
			if(cnt > 0) {
				session.commit();
			}
			
		} catch(PersistenceException e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return cnt;
	}
	@Override
	public List<ClassVO> doctorClass() {
		SqlSession session = MyBatisUtil.getSqlSession();
		
		List<ClassVO> clList = new ArrayList<ClassVO>();
		
		try {
			clList = session.selectList("class.getClass");
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return clList;
	}
	
	public List<DiseaseVO> DiseaseMid() {
		SqlSession session = MyBatisUtil.getSqlSession(true);
		
		List<DiseaseVO> dis = null;
		
		try {
			dis = session.selectList("doctor.DiseaseMid");
			
			
			
		} catch(PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return dis;
		
	}
	@Override
	public int doctorInsert(DoctorVO dtv) {
		SqlSession session = MyBatisUtil.getSqlSession(true);
		
		int cnt = 0;
		
		try {
			cnt = session.insert("doctor.insertDoctor", dtv);
			
			if(cnt > 0) {
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
	public List<AdmissionVO> doctorAdList(String no) {
		List<AdmissionVO> amList = new ArrayList<AdmissionVO>();
		
		SqlSession session = null;
		
		try {
			session = MyBatisUtil.getSqlSession(true);
			
			amList = session.selectList("admission.DoctorAdList", no);
		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return amList;
	}
	@Override
	public List<MedicienVO> mediList() {
		List<MedicienVO> mediList = new ArrayList<MedicienVO>();
		
		SqlSession session = null;
		
		try {
			session = MyBatisUtil.getSqlSession(true);
			
			mediList = session.selectList("doctor.mediList");
		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return mediList;
	}
	@Override
	public List<AppointMentVO> doctorApList(String apNo) {
		List<AppointMentVO> apList = new ArrayList<AppointMentVO>();
		
		SqlSession session = null;
		
		try {
			session = MyBatisUtil.getSqlSession(true);
			
			apList = session.selectList("appointMent.DoctorApList", apNo);
		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return apList;
	}
	@Override
	public AppointMentVO doctorApDetail(String apNo) {
		SqlSession session = MyBatisUtil.getSqlSession(true);
		
		AppointMentVO apVO = null;
		
		try {
			apVO = session.selectOne("appointMent.DoctorApDetail", apNo);
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return apVO;
	}
	@Override
	public int doctorApUpdate(String apNo) {
		SqlSession session = MyBatisUtil.getSqlSession(true);
		
		int cnt = 0;
		
		try {
			cnt = session.update("appointMent.DoctorApUpdate", apNo);
			
			if(cnt > 0) {
				session.commit();
			}
			
		} catch(PersistenceException e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return cnt;
	}
	@Override
	public List<DiagnosisVO> getSearchResults(String searchType, String inputField) {
		SqlSession session = MyBatisUtil.getSqlSession(true);
	    List<DiagnosisVO> diagnosisList = null;
	    try {
	        Map<String, Object> params = new HashMap<>();
	        params.put("searchType", searchType);
	        params.put("inputField", inputField);
	        diagnosisList = session.selectList("diagnosis.getSearchResults", params);
	    } catch (PersistenceException e) {
	        e.printStackTrace();
	    } finally {
	        session.close();
	    }
	    return diagnosisList;
	}
	@Override
	public DiagnosisVO getDiagnosisRecord(String searchType, String inputField) {
		SqlSession session = MyBatisUtil.getSqlSession(true);
	    DiagnosisVO diagnosisVO = null;
	    try {
	        Map<String, Object> params = new HashMap<>();
	        params.put("searchType", searchType);
	        params.put("inputField", inputField);
	        diagnosisVO = session.selectOne("diagnosis.getSearchResults", params);
	    } catch (PersistenceException e) {
	        e.printStackTrace();
	    } finally {
	        session.close();
	    }
	    return diagnosisVO;
	}
	@Override
	public int insertDiagnosis(DiagnosisInsertVO dv) {
		SqlSession session = null;
		
		int cnt = 0;
		
		try {
			session = MyBatisUtil.getSqlSession();
			
			cnt = session.insert("diagnosis.insertDiagnosis", dv);
			
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
	public List<NurseVO> nurseList() {
		List<NurseVO> nurseList = new ArrayList<NurseVO>();
		
		SqlSession session = null;
		
		try {
			session = MyBatisUtil.getSqlSession(true);
			
			nurseList = session.selectList("diagnosis.nurseList");
		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return nurseList;
	}
	@Override
	public int insertPatient(DiagnosisInsertVO dv) {
		SqlSession session = null;
		
		int cnt = 0;
		
		try {
			session = MyBatisUtil.getSqlSession();
			
			cnt = session.insert("diagnosis.insertPatient", dv);
			
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
	public String getMemberPassword(String userId) {
		SqlSession sqlSession = MyBatisUtil.getSqlSession();
		String password = null;
		try {
			password = sqlSession.selectOne("doctor.getDoctorPassword", userId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return password;
	}
	@Override
	public int insertAdmission(DiagnosisInsertVO dv) {
		SqlSession session = null;
		
		int cnt = 0;
		
		try {
			session = MyBatisUtil.getSqlSession();
			
			cnt = session.insert("diagnosis.insertAdmission", dv);
			
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
