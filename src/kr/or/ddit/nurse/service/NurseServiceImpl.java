package kr.or.ddit.nurse.service;

import java.util.List;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.nurse.dao.INurseDao;
import kr.or.ddit.nurse.dao.NurseDaoImpl;
import kr.or.ddit.nurse.vo.NurDiagnosisListVO;
import kr.or.ddit.nurse.vo.NurMemberAdListVO;
import kr.or.ddit.nurse.vo.NurseMediListVO;
import kr.or.ddit.nurse.vo.NurseVO;

public class NurseServiceImpl implements INurseService {

	private INurseDao nurDao;
	private static INurseService nurService = new NurseServiceImpl();
	private NurseServiceImpl() {
		nurDao = NurseDaoImpl.getInstance();
	}
	public static INurseService getInstance() {
		return nurService;
	}
	@Override
	public NurseVO getNurse(String uId) {
		return nurDao.getNurse(uId);
	}
	
	@Override
	public int modifyNurse(NurseVO nsv) {

		
		return nurDao.modifyNurse(nsv);
	}
	@Override
	public NurseVO nurseDetail(String nsNo) {
		return nurDao.nurseDetail(nsNo);
	}
	@Override
	public int nurseUpdate(String nsNo) {
		return nurDao.nurseUpdate(nsNo);
	}
	@Override
	public List<NurMemberAdListVO> NursePatientList() {
		//입원환자 목록
		return nurDao.NursePatientList();
	}
	@Override
	public int nurseInsert(NurseVO nv) {
		return nurDao.nurseInsert(nv);
	}
	@Override
	public List<NurseMediListVO> NurseMedList() {
		return nurDao.NurseMedList();
	}
	@Override
	public boolean checkPassword(String userId, String password) {
		INurseDao nurseDao = NurseDaoImpl.getInstance();
		// 회원 아이디로부터 해당 회원의 비밀번호를 가져옴
		String storedPassword = nurseDao.getMemberPassword(userId);
		
		System.out.println("Stored Password:" + storedPassword);   // 디버깅 출력
		System.out.println("Entered Password: " + password);
		//저장된 비밀번호와 입력된 비밀번호를 비교하여 일치 여부를 반환
		return storedPassword != null && storedPassword.equals(password);
	}
	
}
