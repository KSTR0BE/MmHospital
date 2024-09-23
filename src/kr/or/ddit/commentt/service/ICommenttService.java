package kr.or.ddit.commentt.service;

import kr.or.ddit.commentt.vo.CommenttVO;

public interface ICommenttService {
	public int cmInsert(CommenttVO cv);
	
	public CommenttVO cmGet(String sgNo);
	
	public int cmUpdate(CommenttVO cv);
	
	public int cmDelete(String sgNo);
}
