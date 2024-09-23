package kr.or.ddit.member.service;

import java.util.List;
import java.util.Map;
import java.util.Random;
import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.vo.MemberAdListVO;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.PatientListVO;
import kr.or.ddit.nurse.vo.NurDiagnosisListVO;

public class MemberServiceImpl implements IMemberService {
	
	
	
	
	private IMemberDao mbDao;
	private static IMemberService mbService = new MemberServiceImpl();
	
	private MemberServiceImpl() {
		mbDao = MemberDaoImpl.getInstance();
	}
	
	public static IMemberService getInstance() {
//		if(mbService == null) new MemberDaoImpl();
		return mbService;
	}
	
	@Override
	public MemberVO mbGet(String mbId) {
		
		return mbDao.mbGet(mbId);
	}
	
	@Override
	public int insertMember(MemberVO vo) {
		return mbDao.insertMember(vo);
	}

	@Override
	public String loginCheck(Map<String, Object> map) {
		return mbDao.loginCheck(map);
	}
	
	@Override
	public MemberVO getMember(String uId) {
		return mbDao.getMember(uId);
	}


	
	@Override
	public int modifyMember(MemberVO mv) {
		return mbDao.modifyMember(mv);
	}


	@Override
	public String findId(Map<String, Object> map) {
		return mbDao.findId(map);
	}

	@Override
	public String findPw(Map<String, Object> map) {
		// 아이디 와 주민등록번호로 회원을 찾음
		MemberVO member = mbDao.mbGet(map.get("uId").toString());
		
		// 회원이 존재하지 않는 경우
		if(member == null) {
			return "등록되지 않은 회원입니다.";
		}
		
		// 임시 비밀번호 생성
		String tempPassword = generateTempPassword();
		
		// 비밀번호 변경
		mbDao.updatePassword(map.get("uId").toString(), tempPassword);
		
		// 생성된 임시 비밀번호 반환
		return tempPassword;
	} 


	private String generateTempPassword() {
		// 대문자, 소문자, 숫자, 특수문자를 모두 포함하는 문자열을 정의.
		String upperChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		String lowerChars = "abcdefghijklmnopqrstuvwxyz";
		String numberChars = "0123456789";
		String specialChars = "!@#$%^&*()-_=+[]{}|;:,.<>?";
		
		// 임시 비밀번호를 담을 StringBuilder 객체를 생성.
		StringBuilder tempPassword = new StringBuilder();
		
		// 랜덤 객체를 생성.
		Random rnd = new Random();
		
		// 대문자를 하나 추가.
		tempPassword.append(upperChars.charAt(rnd.nextInt(upperChars.length())));
		
		// 특수문자를 하나 추가.
		tempPassword.append(specialChars.charAt(rnd.nextInt(specialChars.length())));
		
		// 나머지 6자는 소문자와 숫자를 랜덤하게 선택하여 추가.
		for(int i=0; i < 6; i++) {
			// 소문자 또는 숫자를 랜덤하게 선택하여 tempPassword에 추가.
			String candidateChars = lowerChars + numberChars;
			tempPassword.append(candidateChars.charAt(rnd.nextInt(candidateChars.length())));
		}
		
		// 생성된 임시 비밀번호를 섞기.
		char[] passwordChars = tempPassword.toString().toCharArray();
		for(int i = 0; i < passwordChars.length; i++) {
			int randomIndex = rnd.nextInt(passwordChars.length);
			char temp = passwordChars[i];
			passwordChars[i] = passwordChars[randomIndex];
			passwordChars[randomIndex] = temp;
		}
		
		tempPassword = new StringBuilder(String.valueOf(passwordChars));
		
		// 생성된 임시 비밀번호를 반환.
		return tempPassword.toString();
	}

	@Override
	public boolean checkPassword(String userId, String password) {
		IMemberDao memberDao = MemberDaoImpl.getInstance();
		// 회원 아이디로부터 해당 회원의 비밀번호를 가져옴
		String storedPassword = memberDao.getMemberPassword(userId);
		
		System.out.println("Stored Password:" + storedPassword);   // 디버깅 출력
		System.out.println("Entered Password: " + password);
		//저장된 비밀번호와 입력된 비밀번호를 비교하여 일치 여부를 반환
		return storedPassword != null && storedPassword.equals(password);
		
	}

	@Override
	public void updateMemberDelYN(String MEM) {
		mbDao.updateMemberDelYN(MEM);
	}

	@Override
	public List<MemberVO> memSearch(String memNm) {
		return mbDao.memSearch(memNm);
	}
	
	
	@Override
	public List<MemberVO> memList() {
		return mbDao.memList();
	}

	@Override
	public MemberVO memberDetail(String memNo) {
		return mbDao.memberDetail(memNo);
	}

	@Override
	public int memberUpdate(String memNo) {
		return mbDao.memberUpdate(memNo);
	}

	@Override
	public List<PatientListVO> PatientList(String no) {

		return mbDao.PatientList(no);
	}
	
	@Override
	public List<MemberAdListVO> DocPatientList() {

		return mbDao.DocPatientList();
	}

	@Override
	public NurDiagnosisListVO NurdignoList(String memNo) {
		return mbDao.NurdignoList(memNo);
	}


	
}
