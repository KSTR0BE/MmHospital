package kr.or.ddit.admin.service;

import java.util.List;

import kr.or.ddit.admin.vo.AdminVO;
import kr.or.ddit.doctor.vo.DoctorVO;
import kr.or.ddit.nurse.vo.NurseVO;

public interface IAdminService {
	public AdminVO adGet(String adId);

	public List<DoctorVO> AdDoctorList();

	public List<NurseVO> AdNurseList();
}

