package kr.or.ddit.member.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.member.vo.MemberAdListVO;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.PatientListVO;
import kr.or.ddit.nurse.vo.NurDiagnosisListVO;

public interface IMemberService {
	public MemberVO mbGet(String mbId);
	
	public int insertMember(MemberVO vo);

	public String loginCheck(Map<String, Object> map);
	
	public MemberVO getMember(String uId);

	public int modifyMember(MemberVO mv);
	
	public String findId(Map<String, Object> map);
	
	public String findPw(Map<String, Object> map);

	public boolean checkPassword(String userId, String password);

	public void updateMemberDelYN(String userId);


	
	public List<MemberVO> memSearch(String memNm);

	public List<MemberVO> memList();

	public MemberVO memberDetail(String memNo);

	public int memberUpdate(String memNo);

	public List<PatientListVO> PatientList(String no);

	List<MemberAdListVO> DocPatientList();

	public NurDiagnosisListVO NurdignoList(String memNo);

//	public MemberVO getMemberPassword(String userId);

}
