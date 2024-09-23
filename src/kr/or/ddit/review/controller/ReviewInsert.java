package kr.or.ddit.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
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

@MultipartConfig
@WebServlet("/review/insert.do")
public class ReviewInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/sub7/rvInsert.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memNo = request.getParameter("memNo");
		String rvNm = request.getParameter("rvNm");
		String rvTit = request.getParameter("rvTit");
		String rvCon = request.getParameter("rvCon");
		
		IReviewService rvService = ReviewServiceImpl.getInstance();
		IAtchFileService fileService = AtchFileServiceImpl.getInstance();
		
		AtchFileVO atchFileVO = fileService.saveAtchFileList(request.getParts());
		
		ReviewVO rv = new ReviewVO(rvTit, rvCon, memNo, rvNm);
		
		if(atchFileVO != null) {
			rv.setAtchFileId(atchFileVO.getAtchFileId());
		}
		
		int cnt = rvService.rvInsert(rv);
		
		System.out.println("cnt : " + cnt);
		
		String msg = "";
		
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		request.getSession().setAttribute("msg", msg);
		
		response.sendRedirect(request.getContextPath() + "/review.do");
	}

}
