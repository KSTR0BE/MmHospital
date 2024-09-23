package kr.or.ddit.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.PatientListVO;

@WebServlet("/PatientList.do")
//입퇴원 내역 서블릿입니다.
public class PatientList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberVO memVO =(MemberVO)session.getAttribute("MEM");
		String no = memVO.getMem_no();
		
		IMemberService memService = MemberServiceImpl.getInstance();
		List<PatientListVO> patList = memService.PatientList(no);
		
		request.setAttribute("patList", patList);
		request.getRequestDispatcher("/memMypage/PatientList.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memno = request.getParameter("memno");
		
	
	}

}
