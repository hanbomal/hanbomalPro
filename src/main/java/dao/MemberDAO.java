package dao;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.MemberVO;;


public class MemberDAO extends MybatisConnector {
		private final String namespace="member";
		SqlSession sqlSession;
	
	
		private static MemberDAO instance = new MemberDAO();
		private String id;
		private MemberDAO() {
			
		} 
		
		public static MemberDAO getInstance() {
			return instance;
		}
	
		public static Connection getConnection() {
			Connection conn = null;
			try {
				String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:orcl";
				String dbId = "scott";
				String dbpwd = "tiger";
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection(jdbcUrl, dbId, dbpwd);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return conn;
		}
		
	
		public void close (Connection conn, ResultSet rs, PreparedStatement pstmt) {
			if(conn!=null) try {conn.close();} catch(SQLException ex) {}
			if(rs!=null) try {rs.close();} catch(SQLException ex) {}
			if(pstmt!=null) try {pstmt.close();} catch (SQLException e) {}
		}
		
		
		public void insertMember(MemberVO member) {
			sqlSession= sqlSession();
			
			int number = sqlSession.selectOne(namespace + ".getNextNumber" ,member);
			number=number+1;
			
			member.setNum(number);
			
			 
			      sqlSession.insert(namespace + ".insertMember" ,member);
			      sqlSession.commit();
			      sqlSession.close();

			
		}
		
		  public int logOuttime(MemberVO member) {
		         sqlSession= sqlSession();
		         
		         
		            Map map = new HashMap();
		         
		      
		         
		       int chk=sqlSession.update(namespace+".logOuttime", member);
		       
		       
		         
		         sqlSession.commit();
		         sqlSession.close();
		         
		      return chk;
		         
		         
		      }
		      
		


		public MemberVO getMember(String memberid) {
		
			sqlSession= sqlSession();
			
			Map map = new HashMap();
			
			map.put("memberid", memberid);
			
			
			MemberVO member=sqlSession.selectOne(namespace+ ".getMember" ,map);
			
			sqlSession.commit();
			sqlSession.close();
			
			return member;  //when  you need update or want to see your info
			//you can see your info
			
		}
		
		public int updateMember(MemberVO member) {
			
			sqlSession= sqlSession();
			int chk = sqlSession.update(namespace+".updateMember", member);
			sqlSession.commit();
			sqlSession.close();
			
			return chk;
		
			
			
		}
		
		
		public int deleteMember(String memberid,String passwd) {
			
			sqlSession= sqlSession();
			Map map = new HashMap();
			
			map.put("passwd", passwd);
			map.put("memberid", memberid);
			int chk = sqlSession.delete(namespace+".deleteMember", map);
			sqlSession.commit();
			sqlSession.close();
			
			return chk;
			
		}
		
public int beforeCheck(String memberid,String passwd) {
			
			sqlSession= sqlSession();
			Map<String, String> map = new HashMap<String,String>();
			
			
			map.put("passwd", passwd);
			map.put("memberid", memberid);
			
			String chk = sqlSession.selectOne(namespace+".checkMember", map);
			
			if(chk!=null) {
				if(chk.equals(passwd)) {return 1;}
				
			}else
			
			sqlSession.commit();
			sqlSession.close();
			
			return -1;
			
		}
		 
		 
		public int login(String memberid, String password) {
			sqlSession=sqlSession();
			Map<String, String> map = new HashMap<String,String>();
			map.put("memberid", memberid);
			String chk=sqlSession.selectOne(namespace+".login",map);
			if(chk!=null) {
				if(chk.equals(password)) {return 1;}
				else {return 0;}
			}
			sqlSession.close();
			return -1; 
		}
		
//for find passwd //1.input id -->get passwdq --->if passwdkey ok -->go to passwd board
	   
public int findPasswd(String memberid,String passwdq,String passwdkey) {
			
			sqlSession= sqlSession();
			Map<String, String> map = new HashMap<String,String>();
			
			
			map.put("passwdq",passwdq );
			map.put("passwdkey", passwdkey);
			map.put("memberid", memberid);
			
			
			String chk = sqlSession.selectOne(namespace+".findPasswd", map);
			
			if(chk!=null) {
				if(chk.equals(passwdkey)) {return 1;}
				
			}else
			
			sqlSession.commit();
			sqlSession.close();
			
			return -1;
			
		}

public boolean confirmId(String memberid) {
	   boolean b=false;
	   Connection conn = null;
	    PreparedStatement pstmt = null;
	   ResultSet rs= null;

	   try {
	        conn = getConnection();
	        
	        pstmt = conn.prepareStatement(
	           "select memberid from member where memberid = ?");
	        pstmt.setString(1, memberid);
	        rs= pstmt.executeQuery();

	   b=rs.next();
	    } catch(Exception ex) {
	        ex.printStackTrace();
	    } finally {
	      if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	    }
	   return b;
	}



public int getMemberCount() {
    int x = 0;
    sqlSession=sqlSession();
    x = sqlSession.selectOne(namespace+".getMemberCount");
    sqlSession.close();
    return x;
 }

public List getMembers(int startRow, int endRow) {
	// TODO Auto-generated method stub
	sqlSession= sqlSession();
    Map map = new HashMap();
    map.put("startRow", startRow);
    map.put("endRow", endRow);
   
    
    List li = sqlSession.selectList(namespace + ".getMembers",map);
    sqlSession.close();
	
	
	return li;
}



		 
		
	}

