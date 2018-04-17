package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dao.MybatisConnector;
import model.RelationVO;

public class RelationDAO extends MybatisConnector{
	private static RelationDAO instance = new RelationDAO();
	private RelationDAO() {
	}
	public static RelationDAO getInstance() {
		return instance;
	}
	
	private final String namespace="relation";
	SqlSession sqlSession;
	
	public int requestCount(String memberid) {
		int x = 0;
		sqlSession=sqlSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("memberid", memberid);
		x=sqlSession.selectOne(namespace+".requestCount", map);
		sqlSession.close();
		return x;
		}
	
	public int responseCount(String memberid) {
		int x = 0;
		sqlSession=sqlSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("memberid", memberid);
		x=sqlSession.selectOne(namespace+".responseCount", map);
		sqlSession.close();
		return x;
	}
	
	public void requestJoin(String memberid,String studynum, String studyName, String nickname,
			 String leader) {
		sqlSession=sqlSession();
		Map<String, String> map = new HashMap<String,String>();
		map.put("memberid", memberid);
		map.put("studynum", studynum);
		map.put("studyName", studyName);
		map.put("nickname", nickname);
		map.put("leader", leader);
		sqlSession.insert(namespace+".requestJoin",map);
		sqlSession.commit();
		sqlSession.close();
	}
	public void cancelJoin(String memberid, String studyName) {
		sqlSession=sqlSession();
		Map<String, String> map = new HashMap<String,String>();
		map.put("memberid", memberid);
		map.put("studyName", studyName);
		sqlSession.delete(namespace+".cancelJoin",map);
		sqlSession.commit();
		sqlSession.close();
	}
	public List requestList(int startRow, int endRow,String memberid) {
		sqlSession=sqlSession();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberid", memberid);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<RelationVO> li=sqlSession.selectList(namespace+".requestList",map);
		sqlSession.close();
		return li;
	}
	public List responseList(int startRow, int endRow, String memberid) {
		sqlSession=sqlSession();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberid", memberid);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<RelationVO> li=sqlSession.selectList(namespace+".responseList",map);
		sqlSession.close();
		return li;
	}
	
	
	public void answerNo(String memberid, String leader, String studyName) {
		sqlSession=sqlSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("memberid", memberid);
		map.put("leader", leader);
		map.put("studyName", studyName);
		sqlSession.update(namespace+".answerNo",map);
		sqlSession.commit();
		sqlSession.close();
	}
	
	public void answerYes(String memberid, String leader, String studyName) {
		sqlSession=sqlSession();
		Map<String, String> map = new HashMap<String,String>();
		map.put("memberid", memberid);
		map.put("leader", leader);
		map.put("studyName", studyName);
		sqlSession.update(namespace+".answerYes",map);
		sqlSession.update(namespace+".peopleCountUp",map);
		sqlSession.commit();
		sqlSession.close();
	}
	
	public List getJoinMemberList(String studyName) {
		sqlSession=sqlSession();
		Map map=new HashMap();
		map.put("studyName", studyName);
		
		List li=null;
		
		li=sqlSession.selectList(namespace+".getJoinMemberList",map);
		
		sqlSession.close();
		return li;
	}
	
	public List getJoinMemberListForChat(String studyName) {
		sqlSession=sqlSession();
		Map map=new HashMap();
		map.put("studyName", studyName);
		
		List li=null;
		
		li=sqlSession.selectList(namespace+".getJoinMemberListForChat",map);
		
		sqlSession.close();
		return li;
	}
	
	
	public List getMemberList(int startRow, int endRow,String studyName) {
		sqlSession=sqlSession();
		Map map=new HashMap();
		map.put("studyName", studyName);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List li=null;
		
		li=sqlSession.selectList(namespace+".getMemberList",map);
		
		sqlSession.close();
		return li;
	}
	
	
	
	
	public RelationVO getMemberInfo(String studyName,String memberid) {
		sqlSession=sqlSession();
		Map map=new HashMap();
		map.put("studyName", studyName);
		map.put("memberid", memberid);
		
		RelationVO memberInfo=sqlSession.selectOne(namespace+".getMemberInfo",map);
		
		sqlSession.close();
		
		
		return memberInfo;
	}
	
	public void updateMemberInfo(RelationVO member) {
		sqlSession=sqlSession();
	
		
		sqlSession.update(namespace+".updateMemberInfo",member);
		sqlSession.commit();
		sqlSession.close();
	}
	
	
	public void leaveStudy(String studynum,String memberid) {
		
		sqlSession=sqlSession();
		Map map=new HashMap();
		map.put("studynum", studynum);
		map.put("memberid", memberid);
		
		sqlSession.update(namespace+".leaveStudy",map);
		sqlSession.commit();
		sqlSession.close();
		
	}
	
	public void changeLeader(String studynum,String leader) {
		sqlSession=sqlSession();
		Map map=new HashMap();
		map.put("studynum", studynum);
		map.put("leader", leader);
		
		sqlSession.update(namespace+".changeLeader",map);
		sqlSession.commit();
		sqlSession.close();
	}
	
	
}
