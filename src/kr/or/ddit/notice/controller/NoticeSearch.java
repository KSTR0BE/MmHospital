package kr.or.ddit.notice.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.service.NoticeServiceImpl;
import kr.or.ddit.notice.vo.NoticeVO;

@WebServlet("/notice/search.do")
public class NoticeSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String ntTit = request.getParameter("ntTit");
		
		int currentPage = 1; // 현재페이지 기본 값
		
		currentPage = request.getParameter("page") == null ?
				1 : Integer.parseInt(request.getParameter("page"));
		
		INoticeService ntService = NoticeServiceImpl.getInstance();
		int totalCount = ntService.countList2(ntTit); // 총 게시글 갯수
		
		int perPage = 5;
		
		int perList = 5;
		
		int totalPage = (int)Math.ceil((double)totalCount / perList);
		
		int start = (currentPage - 1) * perList + 1;
//		
		int end = start + perList - 1;
		if(end > totalCount)
			end = totalCount; // 전체 글 갯수 초과시 값 조정하기
		
		int startPage = ((currentPage -1) / perPage * perPage) + 1;
//		
		int endPage = startPage + perPage -1;
		if(endPage > totalPage)
			endPage = totalPage; // 전체 페이지 갯수 초과 시 값 조절하기
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("ntTit", ntTit);
		
		List<NoticeVO> ntList = ntService.ntSearch(map);
		
		request.setAttribute("ntList", ntList);
		request.setAttribute("sPage", startPage);
		request.setAttribute("ePage", endPage);
		request.setAttribute("ttPage", totalPage);
		request.setAttribute("cPage", currentPage);
		request.setAttribute("str", start);
		
		request.getRequestDispatcher("/sub7/ntSearch.jsp").forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>post");
		doGet(request, response);
	}

}
