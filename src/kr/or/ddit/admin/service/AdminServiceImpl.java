package kr.or.ddit.admin.service;

import java.util.List;

import kr.or.ddit.admin.dao.AdminDaoImpl;
import kr.or.ddit.admin.dao.IAdminDao;
import kr.or.ddit.admin.vo.AdminVO;
import kr.or.ddit.doctor.vo.DoctorVO;
import kr.or.ddit.nurse.vo.NurseVO;

public class AdminServiceImpl implements IAdminService{
	private IAdminDao adDao;
	
	private static IAdminService adService = new AdminServiceImpl();
	
	public AdminServiceImpl() {
		adDao = AdminDaoImpl.getInstance();
		
	}
	
	public static IAdminService getInstance() {
		return adService;
	}
	
	@Override
	public AdminVO adGet(String adId) {
		return adDao.adGet(adId);
	}

	@Override
	public List<DoctorVO> AdDoctorList() {
		return adDao.AdDoctorList();
	}

	@Override
	public List<NurseVO> AdNurseList() {
		return adDao.AdNurseList();
	}	
	
}
