package kr.or.ddit.suggestions.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.suggestions.service.ISuggestionsService;
import kr.or.ddit.suggestions.service.SuggestionsServiceImpl;

@WebServlet("/suggestions/delete.do")
public class SuggestionsDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sgNo = request.getParameter("sgNo");
		
		ISuggestionsService sgService = SuggestionsServiceImpl.getInstance();
		
		int cnt = sgService.sgDelete(sgNo);
		
		System.out.println("cnt : " + cnt);
		
		String msg = "";
		
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		request.getSession().setAttribute("msg", msg);
		
		response.sendRedirect(request.getContextPath() + "/suggestions.do");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
