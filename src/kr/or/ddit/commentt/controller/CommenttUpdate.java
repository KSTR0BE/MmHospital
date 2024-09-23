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

@WebServlet("/commentt/update.do")
public class CommenttUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sgNo = request.getParameter("sgNo");
		
		ICommenttService cmService = CommenttServiceImpl.getInstance();
		
		CommenttVO cv = cmService.cmGet(sgNo);
		
		request.setAttribute("cv", cv);
		
		request.getRequestDispatcher("/sub7/cmUpdate.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sgNo = request.getParameter("sgNo");
		String cmCon = request.getParameter("cmCon");
		
		ICommenttService cmService = CommenttServiceImpl.getInstance();
		
		CommenttVO cv = new CommenttVO(cmCon, sgNo);
		
		int cnt = cmService.cmUpdate(cv);
		
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
