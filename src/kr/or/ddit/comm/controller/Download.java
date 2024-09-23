package kr.or.ddit.comm.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.comm.service.AtchFileServiceImpl;
import kr.or.ddit.comm.service.IAtchFileService;
import kr.or.ddit.comm.vo.AtchFileDetailVO;

@MultipartConfig
@WebServlet("/download.do")
public class Download extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long atchFileId = request.getParameter("fileId") == null ?
							-1 : Long.parseLong(request.getParameter("fileId"));
		int fileSn = request.getParameter("fileSn") == null ?
							1 : Integer.parseInt(request.getParameter("fileSn"));
		
		// 파일 정보 조회
		IAtchFileService fileService = AtchFileServiceImpl.getInstance();
		
		AtchFileDetailVO atchFileDetailVO = new AtchFileDetailVO();
		atchFileDetailVO.setAtchFileId(atchFileId);
		atchFileDetailVO.setFileSn(fileSn);
		
		atchFileDetailVO = fileService.getAtchFileDetail(atchFileDetailVO);
		
		/*
		 *  파일 다운로드 처리를 위한 Content-Disposition 헤더 설정하기
		 *  
		 *  Content-Disposition : inline(defalut)
		 *  Content-Disposition : attachment // 파일 다운로드
		 *  Content-Disposition : attachment; filename="abc.jpg" // 해당 이름으로 다운로드
		 */
		
		//  파일 다운로드 처리를 위한 응답헤더 정보 설정하기
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment; filename=\""
												+ URLEncoder.encode(atchFileDetailVO.getOrignlFileNm(), "UTF-8").replace("\\+", "%20") + "\"");	
		
		BufferedInputStream bis = new BufferedInputStream(
								new FileInputStream(atchFileDetailVO.getFileStreCours()));
		
		BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
		
		int data = 0;
		while((data = bis.read()) != -1) {
			bos.write(data);
		}
		bis.close();
		bos.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
