package kr.or.ddit.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.doctor.service.DoctorServiceImpl;
import kr.or.ddit.doctor.service.IDoctorService;
import kr.or.ddit.doctor.vo.DoctorVO;

@WebServlet("/adDoctorUpdate.do")
public class AdDoctorUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dtNo = request.getParameter("dtNo");
		IDoctorService dtService = DoctorServiceImpl.getInstance();
		int dcUpdate = dtService.DoctorUpdate(dtNo);
		DoctorVO dcList = dtService.DoctorDetail(dtNo);
		if(dcUpdate > 0) {
//			request.setAttribute("dcList", dcList);
//			request.getRequestDispatcher("/adminMypage/AdDoctorDetail.jsp").forward(request, response);
			Gson gson = new Gson();
			String json = gson.toJson(dcList);
			response.getWriter().print(json);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
