package kr.or.ddit.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.comm.service.AtchFileServiceImpl;
import kr.or.ddit.comm.service.IAtchFileService;
import kr.or.ddit.comm.vo.AtchFileVO;
import kr.or.ddit.review.service.IReviewService;
import kr.or.ddit.review.service.ReviewServiceImpl;
import kr.or.ddit.review.vo.ReviewVO;

@WebServlet("/review/detail.do")
public class ReviewDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rvNo = request.getParameter("rvNo");
		
		IReviewService rvService = ReviewServiceImpl.getInstance();
		
		int cnt = rvService.rvHit(rvNo);
		
		System.out.println("cnt : " + cnt);
		
		ReviewVO rv = rvService.rvGet(rvNo);
		
		long atchFileId = rv.getAtchFileId();
		
		if(atchFileId > 0) {
			IAtchFileService fileService = 
					AtchFileServiceImpl.getInstance();
			
			AtchFileVO atchFileVO = new AtchFileVO();
			atchFileVO.setAtchFileId(atchFileId);
			atchFileVO = fileService.getAtchFile(atchFileVO);
			
			request.setAttribute("atchFileVO", atchFileVO);
		}
		
		request.setAttribute("rv", rv);
		
		request.getRequestDispatcher("/sub7/rvDetail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
