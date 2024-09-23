package kr.or.ddit.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

// 회원정보 수정 
@WebServlet("/modify.do")
public class MemberModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IMemberService service = MemberServiceImpl.getInstance();
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("MEM");
		if(memberVO == null) {
			response.sendRedirect(request.getContextPath() + "/Mlogin.do");
			return;
		}
		MemberVO mv = service.getMember(memberVO.getMem_id());
		
		String msg = request.getParameter("msg");
		System.out.println("get msg >> "+msg);
		if(msg != null) {
			request.setAttribute("msg", msg);
		}
		
        request.setAttribute("MEM", mv);
        System.out.println("get mv>>"+mv);
        request.getRequestDispatcher("/memMypage/MemModify.jsp").forward(request, response);
		   
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("post>>??" );
		String uId  = request.getParameter("uId");
		String uPw= request.getParameter("uPw");
		String name= request.getParameter("name");
		String gender= request.getParameter("gender");
		String mem_mail = request.getParameter("mem_mail");
		String mem_tel = request.getParameter("mem_tel");
		String addr1 = request.getParameter("addr1");
		String mem_addr2 = request.getParameter("mem_addr2");
	 
		MemberVO mem = service.getMember(uId);
		request.setAttribute("mv", mem);

		
		MemberVO mv = new MemberVO(uId, uPw, name, gender, mem_mail, mem_tel, addr1, mem_addr2);
//		MemberVO mmv = new MemberVO(name, gender);
//		MemberVO mv = new MemberVO(uId, uPw, mem_mail, addr1, mem_addr2, mem_tel);
		System.out.println("post mv >>" + uId + uPw + "입니당");
		
		
		int cnt = service.modifyMember(mv);
		
		System.out.println("cnt >> "+cnt);
		if(cnt > 0) {
			request.getAttribute(name);
			request.getAttribute(gender);
			request.getSession().setAttribute("MEM", mv);
//			request.getSession().setAttribute("MEM", mmv);
			response.sendRedirect(request.getContextPath()+"/modify.do?msg=1");
		}else {
			response.sendRedirect(request.getContextPath() + "/modify.do");
//			request.getRequestDispatcher("/memMypage/MemModify.jsp").forward(request, response);
		}
			
		
		
	}

}
