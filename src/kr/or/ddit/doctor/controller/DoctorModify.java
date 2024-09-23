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

@WebServlet("/docModify.do")
public class DoctorModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
    IDoctorService service = DoctorServiceImpl.getInstance();    

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		DoctorVO doctorVO =(DoctorVO)session.getAttribute("DOC");
		if(doctorVO == null) {
			response.sendRedirect(request.getContextPath() + "/Dlogin.do");
			return;
		}
		
		DoctorVO dv = service.getDoctor(doctorVO.getDt_id());
		String msg = request.getParameter("msg");
		
		if(msg != null) {
			request.setAttribute("msg", msg);
		}
		
		request.setAttribute("dv", dv);
		request.getRequestDispatcher("/docMypage/DocModify.jsp").forward(request, response);
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String uId = request.getParameter("uId");
		String uPw = request.getParameter("uPw");
		String name = request.getParameter("name");
		String mail = request.getParameter("dc_mail");
		
		DoctorVO dcv = service.getDoctor(uId); 
		request.setAttribute("dv", dcv);
		
		DoctorVO dv = new DoctorVO(uId, uPw, name, mail);
		System.out.println();
		
		int cnt = service.modifyDoctor(dv);
		
		if(cnt > 0 ) {
			request.getAttribute(name);
			request.getSession().setAttribute("DOC", dv);
			response.sendRedirect(request.getContextPath()+"/docModify.do?msg=1");
		}else {
			request.getRequestDispatcher("/docMypage/DocModify.jsp").forward(request, response);
		}
		
	}

}
