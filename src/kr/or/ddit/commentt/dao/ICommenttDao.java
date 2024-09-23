package kr.or.ddit.commentt.dao;

import kr.or.ddit.commentt.vo.CommenttVO;

public interface ICommenttDao {
	public int cmInsert(CommenttVO cv);
	
	public CommenttVO cmGet(String sgNo);
	
	public int cmUpdate(CommenttVO cv);
	
	public int cmDelete(String sgNo);
}
