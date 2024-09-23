package kr.or.ddit.nurse.dao;

import java.util.List;

import kr.or.ddit.nurse.vo.NurDiagnosisListVO;
import kr.or.ddit.nurse.vo.NurMemberAdListVO;
import kr.or.ddit.nurse.vo.NurseMediListVO;
import kr.or.ddit.nurse.vo.NurseVO;

public interface INurseDao {


	public NurseVO getNurse(String uId);

	 public int modifyNurse(NurseVO nsv);

	public NurseVO nurseDetail(String nsNo);

	public int nurseUpdate(String nsNo);

	//입원환자 목록 
	public List<NurMemberAdListVO> NursePatientList();

	public int nurseInsert(NurseVO nv);

	public List<NurseMediListVO> NurseMedList();

	public String getMemberPassword(String userId);

}
