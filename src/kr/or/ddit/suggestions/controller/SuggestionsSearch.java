package kr.or.ddit.suggestions.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.suggestions.service.ISuggestionsService;
import kr.or.ddit.suggestions.service.SuggestionsServiceImpl;
import kr.or.ddit.suggestions.vo.SuggestionsVO;

@WebServlet("/suggestions/search.do")
public class SuggestionsSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sgTit = request.getParameter("sgTit");
		
		ISuggestionsService sgService = SuggestionsServiceImpl.getInstance();
		
		List<SuggestionsVO> sgList = sgService.sgSearch(sgTit);
		
		request.setAttribute("sgList", sgList);
		
		request.getRequestDispatcher("/sub7/sgSearch.jsp").forward(request, response);
	}

}
