package kr.or.ddit.commentt.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.commentt.service.CommenttServiceImpl;
import kr.or.ddit.commentt.service.ICommenttService;
import kr.or.ddit.commentt.vo.CommenttVO;

@WebServlet("/commentt/insert.do")
public class CommenttInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sgNo = request.getParameter("sgNo");
		
		request.setAttribute("sgNo", sgNo);
		
		request.getRequestDispatcher("/sub7/cmInsert.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sgNo = request.getParameter("sgNo");
		String cmCon = request.getParameter("cmCon");
		
		ICommenttService cmService = CommenttServiceImpl.getInstance();
		
		CommenttVO cv = new CommenttVO(cmCon, sgNo);
		
		int cnt = cmService.cmInsert(cv);
		
		System.out.println("성공" + cnt);
		
		String msg = "";
		
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		request.getSession().setAttribute("msg", msg);
		
		response.sendRedirect(request.getContextPath() + "/suggestions.do");
	}

}
