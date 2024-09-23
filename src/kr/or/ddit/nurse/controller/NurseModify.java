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

// 간호사 정보 수정
@WebServlet("/nurModify.do")
public class NurseModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
	INurseService service = NurseServiceImpl.getInstance();
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		NurseVO nurseVO = (NurseVO)session.getAttribute("NUR");
		if(nurseVO == null) {
			response.sendRedirect(request.getContextPath() + "/Nlogin.do");
			return;
		}
		NurseVO nsv = service.getNurse(nurseVO.getNs_id());
		System.out.println("get id >>"+nsv);
		
		
		String msg = request.getParameter("msg");
		System.out.println("msg? " + msg);
		if(msg != null) {
			request.setAttribute("msg", msg);
		}
		
		request.setAttribute("nsv", nsv);
		System.out.println("get nsv >> " + nsv);
		request.getRequestDispatcher("/nurseMypage/NurModify.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("post ?? >> ");
		String uId = request.getParameter("uId");
		String uPw = request.getParameter("uPw");
		String name = request.getParameter("name");
		String ns_mail = request.getParameter("ns_mail");
		
		
		NurseVO nsv = service.getNurse(uId);
		System.out.println("post ns >> "+uId);
		request.setAttribute("nsv", nsv);
		
		
		NurseVO ns = new NurseVO(uId, uPw , ns_mail, name);
		System.out.println("ns >> " + ns.getNs_id() + uPw + ns_mail);
//		
		
		
		int cnt = service.modifyNurse(ns);
		System.out.println("cnt>>  " +cnt);
		if(cnt > 0) {
			request.getAttribute(name);
			request.getSession().setAttribute("NUR", ns);
			response.sendRedirect(request.getContextPath()+"/nurModify.do?msg=1");
		}else {
			request.getRequestDispatcher("/nurseMypage/NurModify.jsp").forward(request, response);
		}
	}

}
