package kr.or.ddit.appointMent.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.appointMent.dao.AppointmentDaoImpl;
import kr.or.ddit.appointMent.dao.IAppointmentDao;
import kr.or.ddit.appointMent.vo.AppointMentVO;
import kr.or.ddit.appointMent.vo.DiagnosisVO;
import kr.or.ddit.doctor.vo.DoctorVO;


public class AppointmentServiceImpl implements IAppointmentService{
	private IAppointmentDao amDao;
	
	private static IAppointmentService amService = new AppointmentServiceImpl();
	
	public AppointmentServiceImpl() {
		amDao = AppointmentDaoImpl.getInstance();
	}
	
	public static IAppointmentService getInstance() {
		return amService;
	}

	@Override
	public int insertAppoint(AppointMentVO apmVO) {
		return amDao.insertAppoint(apmVO);
	}

	@Override
	public AppointMentVO appointRecord(int memNo) {
		// TODO Auto-generated method stub
		return amDao.appointRecord(memNo);
	}

	@Override
	public List<DiagnosisVO> appointData(int no) {
		// TODO Auto-generated method stub
		return amDao.appointData(no);
	}

	@Override
	public int appointDelete(int no) {
		return amDao.appointDelete(no);
	}

	@Override
	public List<DiagnosisVO> DgSearch(Map<String, Object> paramMap) {
		return amDao.DgSearch(paramMap);
	}

	@Override
	public List<DoctorVO> searchDoctor(int cl_no) {
		return amDao.searchDoctor(cl_no);
	}


	@Override
	public AppointMentVO amChk(AppointMentVO apmVO) {
		return amDao.amChk(apmVO);
	}

	@Override
	public AppointMentVO amChk1(AppointMentVO apmVO) {
		return amDao.amChk1(apmVO);
	}
	
}
