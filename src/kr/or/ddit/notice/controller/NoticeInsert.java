package kr.or.ddit.notice.controller;

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
import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.service.NoticeServiceImpl;
import kr.or.ddit.notice.vo.NoticeVO;

@MultipartConfig
@WebServlet("/notice/insert.do")
public class NoticeInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/sub7/ntInsert.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String adNo = request.getParameter("adNo");
		String ntNm = request.getParameter("ntNm");
		String ntTit = request.getParameter("ntTit");
		String ntCon = request.getParameter("ntCon");
		
		INoticeService ntService = NoticeServiceImpl.getInstance();
		IAtchFileService fileService = AtchFileServiceImpl.getInstance();
		
		AtchFileVO atchFileVO = fileService.saveAtchFileList(request.getParts());
		
		NoticeVO nv = new NoticeVO(ntTit, ntCon, adNo, ntNm);
		
		if(atchFileVO != null) {
			nv.setAtchFileId(atchFileVO.getAtchFileId());
		}
		
		int cnt = ntService.ntInsert(nv);
		
		System.out.println("cnt : " + cnt);
		
		String msg = "";
		
		if(cnt > 0) {
			msg = "성공";
		}else {
			msg = "실패";
		}
		
		request.getSession().setAttribute("msg", msg);
		
		response.sendRedirect(request.getContextPath() + "/notice.do");
	}

}
