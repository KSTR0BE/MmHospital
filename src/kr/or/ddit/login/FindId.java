package kr.or.ddit.login;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;


@WebServlet("/login/findId.do")
public class FindId extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private IMemberService memberService = MemberServiceImpl.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("findIdfindId", "findId");
		
		request.getRequestDispatcher("/login/findId.jsp").forward(request, response);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 클라이언트에서 전송된 데이터를 받아옴
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		
		// 받아온 데이터를 Map에 저장
		Map<String, Object> map = new HashMap<>();
		map.put("name", name);
		map.put("tel", tel);
		
		//서비스를 호출하여 아이디를 찾음
		String foundId = memberService.findId(map);
		
		if(foundId != null && !foundId.isEmpty()) {
			// 찾은 아이디를 클라이언트에 응답으로 보냄
			response.getWriter().write(foundId);
		} else {
			// 아이디를 찾지 못한 경우에 대한 처리
			response.getWriter().write("등록되지 않은 회원입니다.");
		}
		
		
		
		
		
		
		
	}
	
}
