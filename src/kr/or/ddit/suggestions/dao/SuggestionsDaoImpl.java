package kr.or.ddit.suggestions.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.suggestions.vo.SuggestionsVO;
import kr.or.ddit.util.MyBatisUtil;

public class SuggestionsDaoImpl implements ISuggestionsDao{
	private static ISuggestionsDao sgDao = new SuggestionsDaoImpl();
	
	private SuggestionsDaoImpl() {
		
	}
	
	public static ISuggestionsDao getInstance() {
		return sgDao;
	}

	@Override
	public List<SuggestionsVO> sgList(Map<String, Object> map) {
		SqlSession session = MyBatisUtil.getSqlSession();
		
		List<SuggestionsVO> sgList = null;
		
		try {
//			sgList = session.selectList("sg.sgList", map);
			sgList = session.selectList("sg.sgSearch2", map);
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		
		return sgList;
	}

	@Override
	public SuggestionsVO sgGet(String sgNo) {
		SqlSession session = MyBatisUtil.getSqlSession();
		
		SuggestionsVO sv = null;
		try {
			sv = session.selectOne("sg.sgGet", sgNo);
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return sv;
	}

	@Override
	public int sgInsert(SuggestionsVO sv) {
		SqlSession session = null;
		
		int cnt = 0;
		
		try {
			session = MyBatisUtil.getSqlSession();
			
			cnt = session.insert("sg.sgInsert", sv);
			
			if(cnt > 0) {
				session.commit();
			}
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return cnt;
	}
	
	@Override
	public int sgInsertD(SuggestionsVO sv) {
		SqlSession session = null;
		
		int cnt = 0;
		
		try {
			session = MyBatisUtil.getSqlSession();
			
			cnt = session.insert("sg.sgInsertD", sv);
			
			if(cnt > 0 ) {
				session.commit();
			}
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		
		return cnt;
	}

	@Override
	public int sgUpdate(SuggestionsVO sv) {
		SqlSession session = null;
		
		int cnt = 0;
		
		try {
			session = MyBatisUtil.getSqlSession();
			
			cnt = session.insert("sg.sgUpdate", sv);
			
			if(cnt > 0) {
				session.commit();
			}
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public int sgDelete(String sgNo) {
		SqlSession session = null;
		
		int cnt = 0;
		
		try {
			session = MyBatisUtil.getSqlSession();
			
			cnt = session.insert("sg.sgDelete", sgNo);
			
			if(cnt > 0) {
				session.commit();
			}
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public int sgHit(String sgNo) {
		SqlSession session = null;
		
		int cnt = 0;
		
		try {
			session = MyBatisUtil.getSqlSession();
			
			cnt = session.insert("sg.sgHit", sgNo);
			
			if(cnt > 0) {
				session.commit();
			}
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public List<SuggestionsVO> sgSearch(String sgTit) {
		List<SuggestionsVO> sgList = new ArrayList<SuggestionsVO>();
		
		SqlSession session = null;
		
		try {
			session = MyBatisUtil.getSqlSession(true);
			
			sgList = session.selectList("sg.sgSearch", sgTit);
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		
		return sgList;
	}

	@Override
	public int countList() {
		SqlSession session = MyBatisUtil.getSqlSession();
		
		int countAll = 0;
		
		try {
			countAll = session.selectOne("sg.countList");
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		
		return countAll;
	}

	@Override
	public int countList2(String sgTit) {
		SqlSession session = MyBatisUtil.getSqlSession();
		
		int countAll = 0;
		
		try {
			countAll = session.selectOne("sg.countList2", sgTit);
		}catch(PersistenceException ex) {
			ex.printStackTrace();
		}finally {
			session.close();
		}
		
		return countAll;	
	}
	
}
