package kr.or.ddit.login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/join.do")
public class Join extends HttpServlet{
	private IMemberService service = MemberServiceImpl.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
		req.getRequestDispatcher("/login/join.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
		req.setCharacterEncoding("UTF-8");
		
		
		String memId 	= req.getParameter("mem_id");
		String memPw 	= req.getParameter("mem_pw");
		String memEm 	= req.getParameter("mem_em");
		String memaddr 	= req.getParameter("mem_addr"); 
		String memTel 	= req.getParameter("mem_tel");
	    String memName 	= req.getParameter("mem_nm");
	    String memGn 	= req.getParameter("mem_gn");
	    String memreg 	= req.getParameter("mem_reg");
	    String memreg2 	= req.getParameter("mem_reg2");
	    String memDyn 	= req.getParameter("del_yn");
	    String memDate 	= req.getParameter("mem_date");
	    String memaddr2 = req.getParameter("mem_addr2"); 
	    
	    MemberVO vo = new MemberVO();
//	    
	    vo.setMem_id(memId);
	    vo.setMem_pw(memPw);
	    vo.setMem_em(memEm);
	    vo.setMem_addr(memaddr);
	    vo.setMem_tel(memTel);
	    vo.setMem_nm(memName);
	    vo.setMem_gn(memGn);
	    vo.setMem_reg(memreg +"-" +memreg2);
	    vo.setDel_yn(memDyn);
	    vo.setMem_date(memDate);
	    vo.setMem_addr2(memaddr2);
	   
	    // BeanUtils를 사용하여 MemberVO 객체에 데이터 매핑
//	    try {
//	        BeanUtils.populate(vo, req.getParameterMap());
//	    } catch (IllegalAccessException | InvocationTargetException e) {
//	        e.printStackTrace();
//	    }

	    System.out.println(">>>" + vo.getMem_nm());

	    int cnt = service.insertMember(vo);

	    System.out.println(">>>"+ vo.getMem_nm());

	    if (cnt > 0) {
	        resp.sendRedirect(req.getContextPath() +"/login.do");
	    } else {
	        req.getRequestDispatcher(req.getContextPath() +"/join.do").forward(req, resp);
	    }
	    
	}
}
