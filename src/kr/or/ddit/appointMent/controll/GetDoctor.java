package kr.or.ddit.appointMent.controll;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.ddit.appointMent.service.AppointmentServiceImpl;
import kr.or.ddit.appointMent.service.IAppointmentService;
import kr.or.ddit.doctor.vo.DoctorVO;


@WebServlet("/GetDoctor.do")
public class GetDoctor extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
	IAppointmentService amService = AppointmentServiceImpl.getInstance();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String deptIdStr = request.getParameter("cl_no");
    	
         int cl_no = Integer.parseInt(deptIdStr);
         
      
         List<DoctorVO> doctorVO = amService.searchDoctor(cl_no);
         
         response.setContentType("text/html; charset=UTF-8");
         PrintWriter out = response.getWriter();
         
         for (DoctorVO doctor : doctorVO) {
             out.println("<option value='" + doctor.getDt_no() + "'>" + doctor.getDt_nm() + "</option>");
         }
         
         out.close();
       
    }
}
