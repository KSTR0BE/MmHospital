package kr.or.ddit.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.comm.service.AtchFileServiceImpl;
import kr.or.ddit.comm.service.IAtchFileService;
import kr.or.ddit.comm.vo.AtchFileVO;
import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.service.NoticeServiceImpl;
import kr.or.ddit.notice.vo.NoticeVO;

@WebServlet("/notice/detail.do")
public class NoticeDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ntNo = request.getParameter("ntNo");
		
		INoticeService ntService = NoticeServiceImpl.getInstance();
		
		int cnt = ntService.ntHit(ntNo);
		
		System.out.println("cnt : " + cnt);
				
		NoticeVO nv = ntService.ntGet(ntNo);
		
		long atchFileId = nv.getAtchFileId();
		
		if(atchFileId > 0) {
			IAtchFileService fileService = 
					AtchFileServiceImpl.getInstance();
			
			AtchFileVO atchFileVO = new AtchFileVO();
			atchFileVO.setAtchFileId(atchFileId);
			atchFileVO = fileService.getAtchFile(atchFileVO);
			
			request.setAttribute("atchFileVO", atchFileVO);
		}
		
		request.setAttribute("nv", nv);
		
		request.getRequestDispatcher("/sub7/ntDetail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
