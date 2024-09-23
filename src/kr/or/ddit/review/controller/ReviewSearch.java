package kr.or.ddit.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.review.service.IReviewService;
import kr.or.ddit.review.service.ReviewServiceImpl;
import kr.or.ddit.review.vo.ReviewVO;

/**
 * Servlet implementation class ReviewSearch
 */
@WebServlet("/review/search.do")
public class ReviewSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rvTit = request.getParameter("rvTit");
		
		IReviewService rvService = ReviewServiceImpl.getInstance();
		
		List<ReviewVO> rvList = rvService.rvSearch(rvTit);
		
		request.setAttribute("rvList", rvList);
		
		request.getRequestDispatcher("/sub7/rvSearch.jsp").forward(request, response);
	}

}
