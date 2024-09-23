package kr.or.ddit.doctor.dao;

import java.util.List;


import kr.or.ddit.appointMent.vo.AppointMentVO;
import kr.or.ddit.doctor.vo.AdmissionVO;
import kr.or.ddit.doctor.vo.ClassVO;
import kr.or.ddit.doctor.vo.DiagnosisInsertVO;
import kr.or.ddit.doctor.vo.DiagnosisVO;
import kr.or.ddit.doctor.vo.DiseaseVO;
import kr.or.ddit.doctor.vo.DoctorVO;
import kr.or.ddit.doctor.vo.MedicienVO;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.nurse.vo.NurseVO;

public interface IDoctorDao {

	public DoctorVO getDoctor(String uId);
	
	public int modifyDoctor(DoctorVO dv);

	public List<DiagnosisVO> doctorDnList();

	public DoctorVO doctorDetail(String dtNo);

	public int doctorUpdate(String dtNo);

	public List<ClassVO> doctorClass();
	
	public List<DiseaseVO> DiseaseMid();

	public int doctorInsert(DoctorVO dtv);

	public List<AdmissionVO> doctorAdList(String no);

	public List<MedicienVO> mediList();

	public List<AppointMentVO> doctorApList(String apNo);

	public AppointMentVO doctorApDetail(String apNo);

	public int doctorApUpdate(String apNo);

	public List<DiagnosisVO> getSearchResults(String searchType, String inputField);

	public DiagnosisVO getDiagnosisRecord(String searchType, String inputField);

	public int insertDiagnosis(DiagnosisInsertVO dv);

	public List<NurseVO> nurseList();

	public int insertPatient(DiagnosisInsertVO dv);

	public String getMemberPassword(String userId);

	public int insertAdmission(DiagnosisInsertVO dv);

}
