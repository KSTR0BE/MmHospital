package kr.or.ddit.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/adMemberUpdate.do")
public class AdMemberUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memNo = request.getParameter("memNo");
		IMemberService memService = MemberServiceImpl.getInstance();
		int memUpdate = memService.memberUpdate(memNo);
		MemberVO memList = memService.memberDetail(memNo);
		if(memUpdate > 0) {
			Gson gson = new Gson();
			String json = gson.toJson(memList);
			response.getWriter().print(json);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
