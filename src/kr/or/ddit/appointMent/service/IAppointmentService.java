package kr.or.ddit.appointMent.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.appointMent.vo.AppointMentVO;
import kr.or.ddit.appointMent.vo.DiagnosisVO;
import kr.or.ddit.doctor.vo.DoctorVO;

public interface IAppointmentService {

	int insertAppoint(AppointMentVO apmVO);

	AppointMentVO appointRecord(int memNo);

	List<DiagnosisVO> appointData(int no);

	int appointDelete(int no);

	List<DiagnosisVO> DgSearch(Map<String, Object> paramMap);

	List<DoctorVO> searchDoctor(int cl_no);
	
	public AppointMentVO amChk(AppointMentVO apmVO);
	
	public AppointMentVO amChk1(AppointMentVO apmVO);
}
