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
@WebServlet("/review/update.do")
public class ReviewUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rvNo = request.getParameter("rvNo");
		
		IReviewService rvService = ReviewServiceImpl.getInstance();
		
		ReviewVO rv = rvService.rvGet(rvNo);
		
		long atchFileId = rv.getAtchFileId();

		if (atchFileId > 0) {
			IAtchFileService fileService = AtchFileServiceImpl.getInstance();

			AtchFileVO atchFileVO = new AtchFileVO();
			atchFileVO.setAtchFileId(atchFileId);
			atchFileVO = fileService.getAtchFile(atchFileVO);

			request.setAttribute("atchFileVO", atchFileVO);
		}
		
		request.setAttribute("rv", rv);
		
		request.getRequestDispatcher("/sub7/rvUpdate.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rvNo = request.getParameter("rvNo");
		String rvTit = request.getParameter("rvTit");
		String rvCon = request.getParameter("rvCon");
		
		long atchFileId = request.getParameter("atchFileId") == null ?
				-1 : Long.parseLong(request.getParameter("atchFileId"));
		
		IReviewService rvService = ReviewServiceImpl.getInstance();
		IAtchFileService fileService = AtchFileServiceImpl.getInstance();
		
		AtchFileVO atchFileVO = fileService.saveAtchFileList(request.getParts());
		
		ReviewVO rv = new ReviewVO(rvTit, rvCon, rvNo);
		
		if(atchFileVO == null) { // 신규 첨부파일이 존재하지 않은 경우
			// 기존첨부파일 삭제 체크되었으면
			
			rv.setAtchFileId(atchFileId);
		}else {
			rv.setAtchFileId(atchFileVO.getAtchFileId());
		}
		
		int cnt = rvService.rvUpdate(rv);
		
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
