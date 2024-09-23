package kr.or.ddit.nurse.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.doctor.service.DoctorServiceImpl;
import kr.or.ddit.doctor.service.IDoctorService;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.nurse.service.INurseService;
import kr.or.ddit.nurse.service.NurseServiceImpl;
import kr.or.ddit.nurse.vo.NurDiagnosisListVO;

@WebServlet("/DignosisList.do")
public class DignosisList extends HttpServlet {
	//간호사 마이페이지 입원환자 처방 상세보기
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memNo = request.getParameter("memNo");
		IMemberService memService = MemberServiceImpl.getInstance();
		NurDiagnosisListVO digVO = memService.NurdignoList(memNo);
		
		
				
		request.setAttribute("digVO", digVO);
		request.getRequestDispatcher("/nurseMypage/NurDiagnosis.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
