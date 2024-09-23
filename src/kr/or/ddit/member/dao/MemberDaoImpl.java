package kr.or.ddit.member.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.doctor.vo.DoctorVO;
import kr.or.ddit.member.vo.MemberAdListVO;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.PatientListVO;
import kr.or.ddit.nurse.vo.NurDiagnosisListVO;
import kr.or.ddit.util.MyBatisUtil;

public class MemberDaoImpl implements IMemberDao {
	private static IMemberDao mbDao = new MemberDaoImpl();
	
	public MemberDaoImpl() {
		
	}
	
	public static IMemberDao getInstance() {
		return mbDao;
	}
	

	@Override
	public MemberVO mbGet(String mbId) {
		SqlSession sqlSession = MyBatisUtil.getSqlSession();
		MemberVO member = null;
		
		try {
			member = sqlSession.selectOne("member.getMember", mbId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return member;
	}
	
	//회원가입
	@Override
	public int insertMember(MemberVO vo) {
		SqlSession sqlSession = MyBatisUtil.getSqlSession();
		
		int cnt = 0;
		
		try {
			cnt = sqlSession.update("member.insertMember", vo);
			
			if(cnt > 0) {
				sqlSession.commit();
			}
		} catch(PersistenceException e) {
			e.printStackTrace();
			sqlSession.rollback();
		} finally {
			sqlSession.close();
		}
		
		return cnt;
	}

	
	@Override
	public String loginCheck(Map<String, Object> map) {
		String rst = "";

		SqlSession sqlSession = MyBatisUtil.getSqlSession();

		try {
			rst = sqlSession.selectOne("member.loginCheck", map);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return rst;
	}
	
	
	@Override
	public MemberVO getMember(String uId) {
		SqlSession session = MyBatisUtil.getSqlSession();
		
		MemberVO mv = null;
		
		try {
			
			mv= session.selectOne("member.getMember",uId);
			
			
		} catch (PersistenceException ex) {
			ex.printStackTrace();
		} finally {
			session.close();
		}
		return mv;
	}


	@Override
	public String findId(Map<String, Object> map) {
		String fid = "아이디를 찾을 수 없습니다.";
		
		SqlSession sqlSession = MyBatisUtil.getSqlSession();

		try {
			fid = sqlSession.selectOne("member.findId", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return fid;
	}
	
	//회원정보 수정
	@Override
	public int modifyMember(MemberVO mv) {
		
		SqlSession sqlSession = MyBatisUtil.getSqlSession(true);
		
		int cnt =0;
		
		try {
			cnt = sqlSession.insert("member.modifyMember", mv);
			if(cnt > 0) {
				sqlSession.commit();
			}
		} catch (PersistenceException e) {
			e.printStackTrace();
		
		}finally {
			sqlSession.close();
		}
		
		return cnt;
	}

	@Override
	public String findPw(Map<String, Object> map) {
		String fpw = null;
		SqlSession sqlSession = MyBatisUtil.getSqlSession();
		
		try {
			MemberVO member = sqlSession.selectOne("member.findPw", map);
			if(member == null) {
				// 회원이 존재하지 않는 경우
				return null;
			}
			fpw = member.getMem_pw();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return fpw;
	}

	@Override
	public void updatePassword(String uId, String tempPassword) {
		SqlSession sqlSession = MyBatisUtil.getSqlSession();
		
		try {
			Map<String, Object>paramMap = new HashMap<>();
			paramMap.put("uId", uId);
			paramMap.put("tempPassword", tempPassword);
			
			sqlSession.update("member.updatePassword", paramMap);
			sqlSession.commit();
		} catch (PersistenceException e) {
			e.printStackTrace();
			sqlSession.rollback();
		} finally {
			sqlSession.close();
		}
		
	}
	
	@Override
	public List<MemberVO> memSearch(String memNm) {
		SqlSession sqlSession = MyBatisUtil.getSqlSession();
		
		List<MemberVO> mem = new ArrayList<MemberVO>();
		
		try {
			mem = sqlSession.selectList("member.memSearch",memNm);
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		}
				
				
		return mem;
	}

	@Override
	public List<MemberVO> memList() {
		SqlSession session = MyBatisUtil.getSqlSession(true);
		
		List<MemberVO> memList = new ArrayList<MemberVO>();
		
		try {
			memList = session.selectList("member.MemberList");
			
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return memList;
	}

	@Override
	public void updateMemberDelYN(String userId) {
		try(SqlSession sqlSession = MyBatisUtil.getSqlSession()){
			sqlSession.update("member.updateMemberDelYN", userId);
			sqlSession.commit();
		}
	}

	@Override
	public String getMemberPassword(String userId) {
		SqlSession sqlSession = MyBatisUtil.getSqlSession();
		String password = null;
		try {
			password = sqlSession.selectOne("member.getMemberPassword", userId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return password;
	}

	@Override
	public MemberVO memberDetail(String memNo) {
		SqlSession session = MyBatisUtil.getSqlSession(true);
		
		MemberVO mv = null;
		
		try {
			mv = session.selectOne("member.MemberDetail", memNo);
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return mv;
	}

	@Override
	public int memberUpdate(String memNo) {
		SqlSession session = MyBatisUtil.getSqlSession(true);
		
		int cnt = 0;
		
		try {
			cnt = session.update("member.MemberUpdate", memNo);
			
			if(cnt > 0) {
				session.commit();
			}
			
		} catch(PersistenceException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public List<PatientListVO> PatientList(String no) {

		List<PatientListVO> patList = new ArrayList<PatientListVO>();
		SqlSession session = null;
		
		try {
			session = MyBatisUtil.getSqlSession(true);
			patList = session.selectList("patList.PatientList" , no);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return patList;
	}

	@Override
	public List<MemberAdListVO> DocPatientList() {
		// 담당의사 입원내역 조회
		SqlSession session = MyBatisUtil.getSqlSession(true);
		List<MemberAdListVO> docList = new ArrayList<MemberAdListVO>();
		
		try {
			docList = session.selectList("patientList.DocPatientList");
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return docList;
	}

	@Override
	public NurDiagnosisListVO NurdignoList(String memNo) {
		SqlSession session = MyBatisUtil.getSqlSession(true);	
		NurDiagnosisListVO dgVO = null;
		
		try {
			dgVO = session.selectOne("nurseDig.dignosisList", memNo);
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return dgVO;
	}



	

}
