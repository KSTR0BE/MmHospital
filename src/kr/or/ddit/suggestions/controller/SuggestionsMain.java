package kr.or.ddit.suggestions.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.suggestions.service.ISuggestionsService;
import kr.or.ddit.suggestions.service.SuggestionsServiceImpl;
import kr.or.ddit.suggestions.vo.SuggestionsVO;

@WebServlet("/suggestions.do")
public class SuggestionsMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage = 1; // 현재페이지 기본 값
		// 전달되는 페이지 정보를 현재 페이지로 셋팅해야함 >> 기반으로 게시글 목록과 페이징 범위가 변경됨
		
		String sgTit = request.getParameter("sgTit") == null ? 
				"" : request.getParameter("sgTit");
		
		currentPage = request.getParameter("page") == null ?
						1 : Integer.parseInt(request.getParameter("page"));
		
		System.out.println("넘어온 페이지 >>>>>>>>>>>>> " + currentPage);
		
		// 전체 글 갯수 조회
		ISuggestionsService sgService = SuggestionsServiceImpl.getInstance();
//		int totalCount = sgService.countList(); // 총 게시글 갯수
		int totalCount = sgService.countList2(sgTit); // 총 게시글 갯수
//		
//		// 화면에 표시될 페이지 수
		int perPage = 5;
//		
//		// 한 페이지당 출력할 글 갯수
		int perList = 5;
//		
//		// 전체 페이지 수 = 전체 글 갯수(totalCount) / 페이지당 글 갯수(perList)
//		// double형 변환으로 정확한 값을 도출해야 함
		int totalPage = (int)Math.ceil((double)totalCount / perList);
		System.out.println("현재 페이지 수 >> " + totalPage);
//		
//		// 페이지 별 게시글 범위(start ~ end) 구하기
		int start = (currentPage - 1) * perList + 1;
//		
		int end = start + perList - 1;
		if(end > totalCount)
			end = totalCount; // 전체 글 갯수 초과시 값 조정하기
//		
//		// 페이지 범위(startPage ~ endPage) 구하기
//		for(int i = 1; i < 10; i++) {
//			System.out.println(i + "페이지일때 >> " + (((i - 1) / perPage * perPage) + 1));
//		}
		int startPage = ((currentPage -1) / perPage * perPage) + 1;
//		
		int endPage = startPage + perPage -1;
		if(endPage > totalPage)
			endPage = totalPage; // 전체 페이지 갯수 초과 시 값 조절하기
//		
//		// 게시글 조회 범위 정보 앱에 담아 전달
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("sgTit", sgTit);
//		
//		// 게시글 조회
		List<SuggestionsVO> sgList = sgService.sgList(map);
		
		// 화면에 정보 출력 ~ 페이징
		request.setAttribute("sgList", sgList);
		request.setAttribute("sPage", startPage);
		request.setAttribute("ePage", endPage);
		request.setAttribute("ttPage", totalPage);
		request.setAttribute("cPage", currentPage);
		request.setAttribute("str", start);
		
		request.getRequestDispatcher("/sub7/sgMain.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
