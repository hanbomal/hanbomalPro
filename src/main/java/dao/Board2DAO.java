package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.Board2VO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;







public class Board2DAO extends MybatisConnector {
	private final String namespace = "board2";
	SqlSession sqlSession; 
	private static  Board2DAO instance = new  Board2DAO();
	private  Board2DAO() {}
	public static  Board2DAO getInstance() {
		return instance;
	}
	  
	
	
	
	public int getArticleCount() {
		int x = 0;
		// 추가
		sqlSession= sqlSession();
	
		
		x = sqlSession.selectOne(namespace + ".getArticleCount" );
	
		sqlSession.close();
		return x;

	}
	

	public List getArticles(int startRow, int endRow) { 
		sqlSession= sqlSession();
		Map map = new HashMap();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List li = sqlSession.selectList(namespace + ".getArticles" ,map);
		
		sqlSession.close();
		return li;
		
	}
	
	public void insertArticle(Board2VO article) {
		sqlSession= sqlSession();
		
		// select boardser.nextval from dual
		int number = sqlSession.selectOne(namespace + ".getNextNumber" ,article);
		number=number+1;
		
		
		if(article.getNum()!=0) {	// 0이 아니면 답글.
			sqlSession.update(namespace + ".updateRe_step" ,article);
			article.setRe_level(article.getRe_level() + 1);
			article.setRe_step(article.getRe_step() + 1);
			
		} else { // 0이면 새글 
			article.setRef(number);
			article.setRe_level(0);
			article.setRe_step(0);
		}
		article.setNum(number);
		
	
		
		
		sqlSession.insert(namespace + ".insertArticle" ,article);
		sqlSession.commit(); 
		sqlSession.close();
	}
	public Board2VO getArticle(int num) {
		
		sqlSession= sqlSession();
		Map map = new HashMap();
		map.put("num", num);
		
		sqlSession.update(namespace+".addReadCount",map);
	
		
		Board2VO article = sqlSession.selectOne(namespace + ".getArticle" ,map);
		sqlSession.commit();
		sqlSession.close();
		
		return article;
		
	
	
}
	
	public int updateArticle (Board2VO article) {
		
		sqlSession= sqlSession();
		int chk = sqlSession.update(namespace+".updateArticle", article);
		sqlSession.commit();
		sqlSession.close();
		
		return chk;
	}
	public int deleteArticle (int num) throws Exception {
		
		sqlSession= sqlSession();
		Map map = new HashMap();
		map.put("num", num);
	
		int chk = sqlSession.delete(namespace+".deleteArticle", map);
		sqlSession.commit();
		sqlSession.close();
		
		return chk;
	}
	
}