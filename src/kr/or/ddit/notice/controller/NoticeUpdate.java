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
@WebServlet("/notice/update.do")
public class NoticeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ntNo = request.getParameter("ntNo");
		
		INoticeService ntService = NoticeServiceImpl.getInstance();
		
		NoticeVO nv = ntService.ntGet(ntNo);
		
		long atchFileId = nv.getAtchFileId();

		if (atchFileId > 0) {
			IAtchFileService fileService = AtchFileServiceImpl.getInstance();

			AtchFileVO atchFileVO = new AtchFileVO();
			atchFileVO.setAtchFileId(atchFileId);
			atchFileVO = fileService.getAtchFile(atchFileVO);

			request.setAttribute("atchFileVO", atchFileVO);
		}
		
		request.setAttribute("nv", nv);
		
		request.getRequestDispatcher("/sub7/ntUpdate.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ntNo = request.getParameter("ntNo");
		String ntTit = request.getParameter("ntTit");
		String ntCon = request.getParameter("ntCon");
		
		long atchFileId = request.getParameter("atchFileId") == null ?
				-1 : Long.parseLong(request.getParameter("atchFileId"));
		
		INoticeService ntService = NoticeServiceImpl.getInstance();
		IAtchFileService fileService = AtchFileServiceImpl.getInstance();
		
		AtchFileVO atchFileVO = fileService.saveAtchFileList(request.getParts());
		
		NoticeVO nv = new NoticeVO(ntNo, ntTit, ntCon);
		
		if(atchFileVO == null) { // 신규 첨부파일이 존재하지 않은 경우
			// 기존첨부파일 삭제 체크되었으면
			
			nv.setAtchFileId(atchFileId);
		}else {
			nv.setAtchFileId(atchFileVO.getAtchFileId());
		}
		
		int cnt = ntService.ntUpdate(nv);
		
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
