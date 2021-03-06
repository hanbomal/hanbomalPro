package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.BoardTypeVO;
import model.BoardVO;
import model.CheckListVO;
import model.CommentVO;
import dao.MybatisConnector;

public class BoardDAO extends MybatisConnector {
	private final String namespace = "board";
	private static BoardDAO instance = new BoardDAO();

	public static BoardDAO getInstance() {
		return instance;
	}

	SqlSession sqlSession;
	public List<BoardTypeVO> getTypeList(String group) {
		sqlSession = sqlSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("group", group);
		List<BoardTypeVO> li = sqlSession.selectList(namespace + ".getTypeList", map);
		sqlSession.close();
		return li;
	}
	public List<CommentVO> getCommentList(String boardid, int studynum,int num) {
		sqlSession = sqlSession();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardid", boardid);
		map.put("studynum", studynum);
		map.put("num", num);
		List<CommentVO> li = sqlSession.selectList(namespace + ".getCommentList", map);
		sqlSession.close();
		return li;
	}
	public void addBoard(BoardTypeVO type) {
		sqlSession = sqlSession();
		int number = sqlSession.selectOne(namespace + ".getNextBoardid");
		String boardid=number+"";
		type.setBoardid(boardid);
		System.out.println(type);
		sqlSession.insert(namespace + ".addBoard", type);
		sqlSession.commit();
		sqlSession.close();
	}
	public void addComment(CommentVO comment) {
		sqlSession = sqlSession();
		sqlSession.insert(namespace + ".addComment", comment);
		sqlSession.commit();
		sqlSession.close();
	}

	public int deleteBoard(String boardid,String group) {
		sqlSession = sqlSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("boardid", boardid);
		map.put("studynum", group);
		int deleteNum = sqlSession.delete(namespace + ".deleteBoard", map);
		sqlSession.commit();
		sqlSession.close();
		return deleteNum;
	}
	
	public int deletePosition(String id,String group) {
		sqlSession = sqlSession();
		Map map = new HashMap<String, String>();
		map.put("studynum", group);
		map.put("id", id);
		int deleteNum = sqlSession.delete(namespace + ".deletePosition", map);
		sqlSession.commit();
		sqlSession.close();
		return deleteNum;
	}
	
	public BoardTypeVO getBoardType(String boardid, String group) {
		sqlSession = sqlSession();
		Map map = new HashMap<String, String>();
		map.put("boardid", boardid);
		map.put("group", group);
		BoardTypeVO boardType = sqlSession.selectOne(namespace + ".getBoardType", map);
		sqlSession.commit();
		sqlSession.close();
		return boardType;
	}
	public void checkReader(String studynum, String boardid, int num, 
			String reader, String readerposition) {
		sqlSession = sqlSession();
		Map map = new HashMap<String, Object>();
		map.put("studynum", studynum);
		map.put("boardid", boardid);
		map.put("num", num);
		map.put("reader", reader);
		map.put("readerposition", readerposition);
		sqlSession.insert(namespace + ".checkReader", map);
		sqlSession.commit();
		sqlSession.close();
	}
	public BoardTypeVO getnewBoardType(String group) {
		sqlSession = sqlSession();
		Map map = new HashMap<String, String>();
		map.put("studynum", group);
		BoardTypeVO boardType = sqlSession.selectOne(namespace + ".getnewBoardType", map);
		sqlSession.commit();
		sqlSession.close();
		return boardType;
	}
	public String getReadername(String studynum,String boardid, int num, String memberid) {
		sqlSession = sqlSession();
		Map map = new HashMap<String, Object>();
		map.put("studynum", studynum);
		map.put("boardid", boardid);
		map.put("num", num);
		map.put("memberid", memberid);
		CheckListVO readerOne = sqlSession.selectOne(namespace + ".getReadername", map);
		String reader=null;
		if(readerOne==null) {
			reader="empty";
		}else {
			reader=readerOne.getReader();
		}
		sqlSession.commit();
		sqlSession.close();
		return reader;
	}
	
	
	
	public int getArticleCount(String boardid,String studynum) {
		int x = 0;
		sqlSession = sqlSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("boardid", boardid);
		map.put("studynum", studynum);
		x = sqlSession.selectOne(namespace + ".getArticleCount", map);
		sqlSession.close();
		return x;
	}
	
	public List getArticles(int startRow, int endRow, String boardid, String group) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("boardid", boardid);
		map.put("group", group);
		List li = sqlSession.selectList(namespace + ".getArticles", map);
		sqlSession.close();
		return li;
	}
	public List ReaderList(String boardid, int studynum, int num) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("boardid", boardid);
		map.put("studynum", studynum);
		map.put("num", num);
		List li = sqlSession.selectList(namespace + ".ReaderList", map);
		sqlSession.close();
		return li;
	}
	
	public void insertArticle(BoardVO article) {
		sqlSession = sqlSession();
		Map map = new HashMap<String,String>();
		int number = sqlSession.selectOne(namespace + ".getNextNumber",map);
		if(article.getNum()!=0) {//답글쓰기
			sqlSession.update(namespace+".updateRe_step", article);
			article.setRe_level(article.getRe_level()+1);
			article.setRe_step(article.getRe_step()+1);
		}else {//새글쓰기
			article.setRef(number);
			article.setRe_step(0);
			article.setRe_level(0);
		}
		article.setNum(number);
		sqlSession.insert(namespace + ".insertBoard", article);
		sqlSession.commit();
		sqlSession.close();
	}

	public BoardVO getArticle(int num,String group, String boardid, String chk) {
		sqlSession = sqlSession();
		Map map = new HashMap<String,Object>();
		map.put("num", num);
		map.put("boardid", boardid);
		map.put("group", group);
		if(chk.equals("content")) {
			sqlSession.update(namespace + ".addReadCount", map);
		}
		BoardVO article = sqlSession.selectOne(namespace + ".getArticle", map);
		sqlSession.commit();
		sqlSession.close();
		return article;
	}
	
	

	public int updateArticle(BoardVO article) {
		sqlSession = sqlSession();
		int updateCount = sqlSession.update(namespace + ".updateArticle", article);
		sqlSession.commit();
		sqlSession.close();
		return updateCount;
	}

	public int updateBoardType(BoardTypeVO board) {
		sqlSession = sqlSession();
		int updateCount = sqlSession.update(namespace + ".updateBoardType", board);
		sqlSession.commit();
		sqlSession.close();
		return updateCount;
	}
	public int updatePosition(String id, String groupposition,String studynum) {
		sqlSession = sqlSession();
		Map<String, String> map = new HashMap<String,String>();
		map.put("studynum", studynum);
		map.put("id", id);
		map.put("groupposition", groupposition);
		int updateCount = sqlSession.update(namespace + ".updatePosition", map);
		sqlSession.commit();
		sqlSession.close();
		return updateCount;
	}
	
	public int deleteArticle(int num, String boardid, String studynum) {
		sqlSession = sqlSession();
		Map map = new HashMap<String,Object>();
		map.put("num", num);
		map.put("boardid", boardid);
		map.put("studynum", studynum);
		int deleteNum = sqlSession.delete(namespace + ".deleteArticle", map);
		sqlSession.commit();
		sqlSession.close();
		return deleteNum;
	}
	

	public int getNextBoardid(String group) {
		int x = 0;
		sqlSession = sqlSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("group", group);
		
		x = sqlSession.selectOne(namespace + ".getNextBoardid", map);
		sqlSession.close();
		return x;
	}

}
