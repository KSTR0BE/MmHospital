package kr.or.ddit.nurse.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.nurse.service.INurseService;
import kr.or.ddit.nurse.service.NurseServiceImpl;
import kr.or.ddit.nurse.vo.NurseVO;

/**
 * Servlet implementation class PwChk
 */
@WebServlet("/nurpwCheck.do")
public class NursePwChk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	INurseService service = NurseServiceImpl.getInstance();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		NurseVO nurseVO = (NurseVO)session.getAttribute("NUR");
		
		request.getRequestDispatcher("/nurseMypage/NursepassWordCk.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		NurseVO nurseVO = (NurseVO)session.getAttribute("NUR");
		
		String userId = nurseVO.getNs_id();
		String password = request.getParameter("memPw");
		
		System.out.println("비밀"+password);
		if (service.checkPassword(userId, password)) {
			System.out.println("성공?");
			response.sendRedirect(request.getContextPath() + "/nurModify.do");
		} else {
			System.out.println("실패");
			request.setAttribute("msg", "비밀번호가 일치하지 않습니다. 다시 시도해주세요.");
		    request.getRequestDispatcher("/nurseMypage/NursepassWordCk.jsp").forward(request, response);
		}
	}

}
