package kr.or.ddit.comm.service;

import java.util.Collection;

import javax.servlet.http.Part;

import kr.or.ddit.comm.vo.AtchFileDetailVO;
import kr.or.ddit.comm.vo.AtchFileVO;

public interface IAtchFileService {
	public AtchFileVO saveAtchFileList(Collection<Part> parts);
	
	public AtchFileVO getAtchFile(AtchFileVO atchFileVO);
	
	public AtchFileDetailVO getAtchFileDetail(AtchFileDetailVO atchFileDetailVO);
}
