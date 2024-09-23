package kr.or.ddit.doctor.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.or.ddit.doctor.service.DoctorServiceImpl;
import kr.or.ddit.doctor.service.IDoctorService;
import kr.or.ddit.doctor.vo.DiagnosisVO;
import kr.or.ddit.doctor.vo.DoctorVO;
@WebServlet("/DnDetail.do")
public class DoctorDnDetail extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private IDoctorService doctorService;
	
	@Override
	public void init() throws ServletException {
		doctorService = DoctorServiceImpl.getInstance();
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		DoctorVO doctorVO = (DoctorVO)session.getAttribute("DOC");
		if(doctorVO == null) {
			response.sendRedirect(request.getContextPath() + "/Dlogin.do");
			return;
		}
		
		request.getRequestDispatcher("/docMypage/DocDnDetail.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String inputField = request.getParameter("inputField");
		String searchType = request.getParameter("searchType");
		
		// 서비스 계층의 메서드를 호출하여 검색 결과를 가져옴
		List<DiagnosisVO> records = doctorService.getSearchResults(searchType, inputField);
		
		// 검색 결과를 request 속성에 설정
		request.setAttribute("records", records);
		
		// 결과 페이지로 포워딩
//		request.getRequestDispatcher("/docMypage/DocDnDetail.jsp").forward(request, response); //ajax 요청 위치로 jsp화면 자체가 응답으로 전달됨
		
		//gson >> json으로 변환후 응답으로 넘겨주기
		Gson gson = new Gson();
		String json = gson.toJson(records);
		
		PrintWriter writer = response.getWriter();
		writer.print(json); //요청위치로 응답 전달
	}

}