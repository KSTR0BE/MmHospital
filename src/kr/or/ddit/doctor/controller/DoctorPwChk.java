package kr.or.ddit.doctor.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.doctor.service.DoctorServiceImpl;
import kr.or.ddit.doctor.service.IDoctorService;
import kr.or.ddit.doctor.vo.DoctorVO;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/docpwCheck.do")
public class DoctorPwChk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	IDoctorService service = DoctorServiceImpl.getInstance();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		DoctorVO doctorVO = (DoctorVO)session.getAttribute("DOC");
		
		request.getRequestDispatcher("/docMypage/DoctorpassWordCk.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		DoctorVO doctorVO = (DoctorVO)session.getAttribute("DOC");
		
		String userId = doctorVO.getDt_id();
		String password = request.getParameter("memPw");
		
		System.out.println("비밀"+password);
		if (service.checkPassword(userId, password)) {
			System.out.println("성공?");
			response.sendRedirect(request.getContextPath() + "/docModify.do");
		} else {
			System.out.println("실패");
			request.setAttribute("msg", "비밀번호가 일치하지 않습니다. 다시 시도해주세요.");
		    request.getRequestDispatcher("/docMypage/DoctorpassWordCk.jsp").forward(request, response);
		}
	}

}
