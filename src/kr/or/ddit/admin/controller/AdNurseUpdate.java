package kr.or.ddit.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.nurse.service.INurseService;
import kr.or.ddit.nurse.service.NurseServiceImpl;
import kr.or.ddit.nurse.vo.NurseVO;

@WebServlet("/adNurseUpdate.do")
public class AdNurseUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nsNo = request.getParameter("nsNo");
		INurseService nsService = NurseServiceImpl.getInstance();
		int nsUpdate = nsService.nurseUpdate(nsNo);
		NurseVO nsList = nsService.nurseDetail(nsNo);
		if(nsUpdate > 0) {
			Gson gson = new Gson();
			String json = gson.toJson(nsList);
			response.getWriter().print(json);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
