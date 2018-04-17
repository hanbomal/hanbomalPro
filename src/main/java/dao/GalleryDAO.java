package dao;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.GalleryVO;

public class GalleryDAO extends MybatisConnector {
	private final String namespace = "gall.mybatis";
	private static GalleryDAO instance = new GalleryDAO();

	private GalleryDAO() {	}

	public static GalleryDAO getInstance() {
		return instance;
	}

	SqlSession sqlSession;

	public void addGallery(GalleryVO gallery) {

		sqlSession=sqlSession();
		int num=0;
		num=sqlSession.selectOne(namespace+".getNextNumber");
		gallery.setNum(num);
		sqlSession.insert(namespace+".addGallery",gallery);
		sqlSession.commit();
		sqlSession.close();
		
		
	}
	
	public List galleryList(String studynum) {
		sqlSession=sqlSession();
		List li=null;
		
		Map map=new HashMap();
		map.put("studynum", studynum);
		li=sqlSession.selectList(namespace+".galleryList", map);
		
		sqlSession.close();
		
		return li;
		
	}
	
	public int getGalleryCount(String studynum) {
		sqlSession=sqlSession();
		int count=0;
		
		Map map=new HashMap();
		map.put("studynum", studynum);
		
		count=sqlSession.selectOne(namespace+".getGalleryCount", map);
		
		sqlSession.close();
		
		return count;
		
	}
	
	public List getImages(int startRow, int endRow, String studynum) {
		
		sqlSession=sqlSession();
		
		Map map=new HashMap<String,Object>();
		map.put("studynum", studynum);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List li=null;
		
		li=sqlSession.selectList(namespace+".getImages", map);
		
		sqlSession.close();
		
		
		
		return li;
		
	}
	
	
	public GalleryVO getImage(String num) {
		sqlSession=sqlSession();
		
		Map map=new HashMap<String,Object>();
		map.put("num", num);
		
		GalleryVO gallery=sqlSession.selectOne(namespace+".getImage",map);
		
		sqlSession.close();
		
		return gallery;
		
	}
	
	public void updateGallery(GalleryVO gallery) {
		sqlSession=sqlSession();

		int chk=0;
		chk=sqlSession.update(namespace+".updateGallery", gallery);
		sqlSession.commit();
		sqlSession.close();
		
	}
	

}
