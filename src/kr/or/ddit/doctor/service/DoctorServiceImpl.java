package kr.or.ddit.doctor.service;

import java.util.List;

import kr.or.ddit.appointMent.vo.AppointMentVO;
import kr.or.ddit.doctor.dao.DoctorDaoImpl;
import kr.or.ddit.doctor.dao.IDoctorDao;
import kr.or.ddit.doctor.vo.AdmissionVO;
import kr.or.ddit.doctor.vo.ClassVO;
import kr.or.ddit.doctor.vo.DiagnosisInsertVO;
import kr.or.ddit.doctor.vo.DiagnosisVO;
import kr.or.ddit.doctor.vo.DiseaseVO;
import kr.or.ddit.doctor.vo.DoctorVO;
import kr.or.ddit.doctor.vo.MedicienVO;
import kr.or.ddit.nurse.vo.NurseVO;
import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;

public class DoctorServiceImpl implements IDoctorService {
	
	private IDoctorDao docDao;
	private static IDoctorService docService = new DoctorServiceImpl();
	
	private DoctorServiceImpl() {
		docDao = DoctorDaoImpl.getInstance();
	}
	
	public static IDoctorService getInstance() {
		return docService;
	}

	@Override
	public DoctorVO getDoctor(String uId) {
		return docDao.getDoctor(uId);
	}
	
	@Override
	public int modifyDoctor(DoctorVO dv) {
		
		return docDao.modifyDoctor(dv);
	}

	
	
	@Override
	public List<DiagnosisVO> doctorDnList() {
		
		return docDao.doctorDnList();
	}

	@Override
	public DoctorVO DoctorDetail(String dtNo) {
		return docDao.doctorDetail(dtNo);
	}

	@Override
	public int DoctorUpdate(String dtNo) {
		return docDao.doctorUpdate(dtNo);
	}

	@Override
	public List<ClassVO> DoctorClass() {
		return docDao.doctorClass();
	}
	
	public List<DiseaseVO> DiseaseMid() {
		return docDao.DiseaseMid();
	}

	@Override
	public int InsertDoctor(DoctorVO dtv) {
		return docDao.doctorInsert(dtv);
	}

	@Override
	public List<AdmissionVO> doctorAdList(String no) {
		return docDao.doctorAdList(no);
	}

	@Override
	public List<MedicienVO> mediList() {
		return docDao.mediList();
	}

	@Override
	public List<AppointMentVO> doctorApList(String apNo) {
		return docDao.doctorApList(apNo);
	}

	@Override
	public AppointMentVO doctorApDetail(String apNo) {
		return docDao.doctorApDetail(apNo);
	}

	@Override
	public int doctorApUpdate(String apNo) {
		// TODO Auto-generated method stub
		return docDao.doctorApUpdate(apNo);
	}

	@Override
	public List<DiagnosisVO> getSearchResults(String searchType, String inputField) {
		return docDao.getSearchResults(searchType, inputField);
		
	}

	@Override
	public DiagnosisVO getDiagnosisRecord(String searchType, String inputField) {
		
	    return docDao.getDiagnosisRecord(searchType, inputField);
	}

	@Override
	public int insertDiagnosis(DiagnosisInsertVO dv) {
		
		return docDao.insertDiagnosis(dv);
	}

	@Override
	public List<NurseVO> nurseList() {
		return docDao.nurseList();
	}

	@Override
	public int insertPatient(DiagnosisInsertVO dv) {
		return docDao.insertPatient(dv);
	}

	@Override
	public boolean checkPassword(String userId, String password) {
		IDoctorDao doctorDao = DoctorDaoImpl.getInstance();

		String storedPassword = doctorDao.getMemberPassword(userId);
		
		System.out.println("Stored Password:" + storedPassword);   // 디버깅 출력
		System.out.println("Entered Password: " + password);
		//저장된 비밀번호와 입력된 비밀번호를 비교하여 일치 여부를 반환
		return storedPassword != null && storedPassword.equals(password);
	}

	@Override
	public int insertAdmission(DiagnosisInsertVO dv) {
		return docDao.insertAdmission(dv);
	}
	
}
