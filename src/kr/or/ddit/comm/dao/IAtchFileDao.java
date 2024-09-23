package kr.or.ddit.comm.dao;

import kr.or.ddit.comm.vo.AtchFileDetailVO;
import kr.or.ddit.comm.vo.AtchFileVO;

public interface IAtchFileDao {
	public int insertAtchFile(AtchFileVO atchFileVO);
	
	public int insertAtchFileDetail(AtchFileDetailVO atchFileDetailVO);
	
	public AtchFileVO getAtchFile(AtchFileVO atchFileVO);
	
	public AtchFileDetailVO getAtchFileDetail(AtchFileDetailVO atchFileDetailVO);
}
