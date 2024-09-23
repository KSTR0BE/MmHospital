package kr.or.ddit.member.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.member.vo.MemberAdListVO;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.PatientListVO;
import kr.or.ddit.nurse.vo.NurDiagnosisListVO;

public interface IMemberDao {

	public MemberVO mbGet(String mbId);
	
	// 회원가입
	public int insertMember(MemberVO vo);

	public String loginCheck(Map<String, Object> map);
	
	// 회원 아이디 가져오는거
	public MemberVO getMember(String uId);

	public String findId(Map<String, Object> map);

	public String findPw(Map<String, Object> map);

	public void updatePassword(String string, String tempPassword);
	
	//회원정보 수정
	public int modifyMember(MemberVO mv);

	public void updateMemberDelYN(String userId);
	
	/**
	 * 멤버 이름으로 조회
	 * @param memNm
	 * @return
	 */
	public List<MemberVO> memSearch(String memNm);
	
	//멤버 전체 리스트
	public List<MemberVO> memList();
	
	public MemberVO memberDetail(String memNo);

	public int memberUpdate(String memNo);
	
	public String getMemberPassword(String userId);

	// 회원 입퇴원내역 조회
	public List<PatientListVO> PatientList(String no);

	// 의사 입퇴원내역 조회
	public List<MemberAdListVO> DocPatientList();

	public NurDiagnosisListVO NurdignoList(String memNo);
	
}
