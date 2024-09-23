package kr.or.ddit.doctor.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.appointMent.vo.AppointMentVO;
import kr.or.ddit.doctor.service.DoctorServiceImpl;
import kr.or.ddit.doctor.service.IDoctorService;
import kr.or.ddit.doctor.vo.DoctorVO;

@WebServlet("/doctorApUpdate.do")
public class DoctorApUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String apNo = request.getParameter("apNo");
		IDoctorService apService = DoctorServiceImpl.getInstance();
		int apUpdate = apService.doctorApUpdate(apNo);
		AppointMentVO apList = apService.doctorApDetail(apNo);
		if(apUpdate > 0) {
			Gson gson = new Gson();
			String json = gson.toJson(apList);
			response.getWriter().print(json);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
