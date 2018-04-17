package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import dao.MybatisConnector;
import model.PositionVO;
import model.RelationVO;
import model.StudyVO;

public class StudyDAO extends MybatisConnector{
	private static StudyDAO instance = new StudyDAO();
	private StudyDAO() {
	}
	public static StudyDAO getInstance() {
		return instance;
	}
    private final String namespace="study";
    SqlSession sqlSession;
    
	public void makingStudy(StudyVO study,String nickname) {
		sqlSession=sqlSession();
		int num=sqlSession.selectOne(namespace+".getNextNum");
		study.setNum(num);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("memberid", study.getLeader());
		map.put("studynum", study.getNum());
		map.put("studyname",study.getStudyName());
		map.put("nickname", nickname);
		map.put("leader", study.getLeader());
		sqlSession.insert(namespace+".makingStudy",study);
		sqlSession.insert(namespace+".addRelation",map);
		sqlSession.commit();
		sqlSession.close();
	}
	public List resultList(String studyName, String memberid, String chk) {
		sqlSession=sqlSession();
		Map<String,String> map = new HashMap<String,String>();
		map.put("studyName", studyName);
		List li=null;
		
		if(chk.equals("byDate")) {
			li=sqlSession.selectList(namespace+".resultListByDate",map);
		}else {
			li=sqlSession.selectList(namespace+".resultList",map);
		}
		List groupli=null;
		Iterator it = li.iterator(); 
		if(it.hasNext()) {
			groupli=new ArrayList<StudyVO>();
			do {
				StudyVO groupInfo = (StudyVO) it.next();
				StudyDAO studyDB = StudyDAO.getInstance();
				RelationVO info=studyDB.getRelation(groupInfo.getStudyName(), memberid);
				groupInfo.setRelation(info);
				groupli.add(groupInfo);				
			}while(it.hasNext());
		}
		sqlSession.close();
		return groupli;
	}
	public RelationVO getRelation(String studyName,String memberid ) {
		sqlSession=sqlSession();
		Map<String,String> map = new HashMap<String,String>();
		map.put("studyName", studyName);
		map.put("memberid", memberid);
		RelationVO status=sqlSession.selectOne(namespace+".getRelation",map);
		sqlSession.close();
		return status;
	}
	
	public List getAllStudy() {
		sqlSession=sqlSession();
		List li=sqlSession.selectList(namespace+".getAllStudy");
		sqlSession.close();
		return li;
	}
	public List<PositionVO> getAllPosition(String studynum) {
		sqlSession=sqlSession();
		Map<String, String> map = new HashMap<String,String>();
		map.put("studynum", studynum);
		List<PositionVO> li=sqlSession.selectList(namespace+".getAllPosition",map);
		sqlSession.close();
		return li;
	}
	
	public List<StudyVO> getGroupList(String memberid) {
		sqlSession=sqlSession();
		Map<String, String> map = new HashMap<String,String>();
		map.put("memberid", memberid);
		List<StudyVO> li=sqlSession.selectList(namespace+".getGroupList",map);
		sqlSession.close();
		return li;
	}
	
	public StudyVO getOneStudy(String studynum) {
		sqlSession=sqlSession();
		Map map=new HashMap();
		map.put("num", studynum);
		
		StudyVO study=sqlSession.selectOne(namespace+".getOneStudy",map);
		
		sqlSession.close();
		
		return study;
	}

	public void addPosition(PositionVO position) {
		sqlSession=sqlSession();
		int id=sqlSession.selectOne(namespace+".getNextID",position);
		position.setId(id+1);
		sqlSession.insert(namespace+".addPosition",position);
		sqlSession.commit();
		sqlSession.close();
	}
	public void grantPostion(String memberid,String positionSelect, String studynum) {
		sqlSession=sqlSession();
		Map map=new HashMap();
		map.put("memberid", memberid);
		map.put("positionSelect", positionSelect);
		map.put("studynum", studynum);
		sqlSession.update(namespace+".grantPostion",map);
		sqlSession.commit();
		sqlSession.close();
	}

public List getStudyList(int startRow, int endRow) {
	// TODO Auto-generated method stub
	sqlSession= sqlSession();
    Map map = new HashMap();
    map.put("startRow", startRow);
    map.put("endRow", endRow);
   
    
    List li = sqlSession.selectList(namespace + ".getStudyList",map);
    sqlSession.close();
	
	
	return li;
}

public int getStudyCount() {
    int x = 0;
    sqlSession=sqlSession();
    x = sqlSession.selectOne(namespace+".getStudyCount");
    sqlSession.close();
    return x;
 }

public int deleteStudy(String studyName) {
	
	sqlSession= sqlSession();
	Map map = new HashMap();
	
	
	map.put("studyName", studyName);
	int chk = sqlSession.delete(namespace+".deleteStudy", map);
	sqlSession.commit();
	sqlSession.close();
	
	return chk;
	
}

public void updateStudy(StudyVO study) {
	sqlSession=sqlSession();
	
	sqlSession.update(namespace+".updateStudy",study);
	sqlSession.commit();
	sqlSession.close();
}
	
}
