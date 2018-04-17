package controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.MemberDAO;
import dao.StudyDAO;
import model.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
PageController page=new PageController();
	@RequestMapping("/join2")
	public String join(HttpServletRequest request, HttpServletResponse response,Model mv) throws Throwable {
		page.autoComplete(mv);
		page.HeaderInfo(request, mv);
		int num = 0;
		

		if (request.getParameter("num") != null) {
			num = Integer.parseInt(request.getParameter("num"));
		}
		request.setAttribute("num", num);
		

		return "member/join2";
	}

	@RequestMapping("/joinPro")
	public String joinPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		
		

		MemberVO member = new MemberVO();
		MemberDAO dbpro = MemberDAO.getInstance();

		
		member.setNum(Integer.parseInt(request.getParameter("num")));
		member.setMemberid(request.getParameter("memberid"));
		member.setNickname(request.getParameter("nickname"));
		member.setPasswd(request.getParameter("passwd"));
		member.setPasswdq(request.getParameter("passwdq"));
		member.setPasswdkey(request.getParameter("passwdkey"));
		dbpro.insertMember(member);

		response.sendRedirect(request.getContextPath() + "/page/main");

		return null;
	}

	@RequestMapping("/loginPro")
	public String loginPro(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String memberid = req.getParameter("memberid");
		String passwd = req.getParameter("passwd");
		MemberDAO dbPro = MemberDAO.getInstance();
		int pwcheck = dbPro.login(memberid, passwd);
		MemberVO member =dbPro.getMember(memberid);
		if (pwcheck == 1) {
		
			HttpSession session = req.getSession();
			session.setAttribute("memberid", memberid);
			session.setAttribute("nickname", member.getNickname());
		
			res.sendRedirect(req.getContextPath() + "/page/main");
		
		} else {
			req.setAttribute("pwcheck", pwcheck);
			return "member/loginPro";
		}
		return null;
	}
	
	@RequestMapping("/logoutPro")   
    public String LogoutPro(HttpServletRequest req, HttpServletResponse res)  throws Throwable {
          
        HttpSession  session = req.getSession();
      
       MemberDAO dbpro = MemberDAO.getInstance();
       
       String memberid=((String)session.getAttribute("memberid"));
       
       req.setAttribute("memberid", memberid);
       
    
       
       
       MemberVO member=dbpro.getMember((String)session.getAttribute("memberid"));
       
       req.setAttribute("member", member);
    
    
          int chk=dbpro.logOuttime(member);
    
        session.invalidate(); //
        
        
        res.sendRedirect(req.getContextPath() + "/page/main"); // 
       return null;
    }
	
	
	
	@RequestMapping("/member_update")	 //form 
	   public String member_update(HttpServletRequest req, HttpServletResponse res,Model mv)  throws Throwable {
		HttpSession session = req.getSession();
		page.autoComplete(mv);
		page.HeaderInfo(req, mv);
		
		

		try {
	
		 MemberDAO dbPro=MemberDAO.getInstance();
		MemberVO member=dbPro.getMember((String)session.getAttribute("memberid"));
		
		req.setAttribute("member", member);
		
		}catch(Exception e) {}
		
	      return "member/member_update";
	   }
	
	@RequestMapping("/member_updatePro")	
	   public String member_updatePro(HttpServletRequest req, HttpServletResponse res)  throws Throwable {
		     
		MemberVO member=new MemberVO();
		MemberDAO dbpro=MemberDAO.getInstance();
	
	String memberid=req.getParameter("memberid");
	
	String num= req.getParameter("num");
	
	try {
		member.setMemberid(memberid);
		member.setNickname(req.getParameter("nickname"));
		member.setPasswd(req.getParameter("passwd"));
		
		member.setNum(Integer.parseInt(req.getParameter("num")));
		member.setPasswdq(req.getParameter("passwdq"));
		member.setPasswdkey(req.getParameter("passwdkey"));
		
		
		int chk=dbpro.updateMember(member);
		
		req.setAttribute("chk", chk);
		
	
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	return "member/member_updatePro";

}
	
	@RequestMapping("/member_delete")	 //form 
	   public String member_delete(HttpServletRequest req, HttpServletResponse res,Model mv)  throws Throwable {
		page.autoComplete(mv);
		page.HeaderInfo(req, mv);
		HttpSession session = req.getSession();
		
		String memberid=((String)session.getAttribute("memberid"));
		
		   req.setAttribute("memberid", memberid); //
		
		
		return "member/member_delete";
}
	
	@RequestMapping("/member_deletePro")	 //form 
	   public String member_deletePro(HttpServletRequest req, HttpServletResponse res)  throws Throwable {
	
		
		
		String memberid=req.getParameter("memberid");
		String passwd = req.getParameter("passwd");
		
		MemberDAO dbPro=MemberDAO.getInstance();
		int chk=dbPro.deleteMember(memberid, passwd);
		
		req.setAttribute("chk", chk);
		
		return "member/member_deletePro";
}
	
	
	@RequestMapping("/before_check")    //form 
    public String before_check(HttpServletRequest req, HttpServletResponse res,Model mv)  throws Throwable {
		page.autoComplete(mv);
		page.HeaderInfo(req, mv);
       HttpSession session = req.getSession();
    
    String memberid=((String)session.getAttribute("memberid"));
    
       req.setAttribute("memberid", memberid); //
       
    
    return "member/before_check";
}
 
 @RequestMapping("/before_checkPro")    //form 
    public String before_checkPro(HttpServletRequest req, HttpServletResponse res)  throws Throwable {
    
    
    
    String memberid=req.getParameter("memberid");
    String passwd = req.getParameter("passwd");
    
    MemberDAO dbPro=MemberDAO.getInstance();
    
    int chk=dbPro.beforeCheck(memberid, passwd);
    req.setAttribute("chk",chk);
    
    return "member/before_checkPro";
}
 
 @RequestMapping("/findPasswd")    //占썩�ο옙�쇽옙占쏙옙占� 筌≪��占쏙옙 占쏙옙 
 public String bfindPasswd(HttpServletRequest req, HttpServletResponse res)  throws Throwable {

 return "member/findPasswd";

 }
 
 
 @RequestMapping("/findpasswdPro")    //form 
 public String findPasswdPro(HttpServletRequest req, HttpServletResponse res)  throws Throwable {
	
    MemberDAO dbPro=MemberDAO.getInstance();
	 

	 
	 String memberid=req.getParameter("memberid");
	 String passwdq=req.getParameter("passwdq");
	 String passwdkey=req.getParameter("passwdkey");
	 int chk=dbPro.findPasswd(memberid, passwdq, passwdkey);
	 req.setAttribute("chk", chk);
	 
	req.setAttribute("memberid", memberid);
	 req.setAttribute("passwdq", passwdq);
	 req.setAttribute("passwdkey", passwdkey);

	 
	 MemberVO member=dbPro.getMember(memberid);
	  
	    req.setAttribute("member", member);
	    
  
 return "/member/findpasswdPro";
}
 @RequestMapping("/member_List")
 public String member_List(HttpServletRequest request,
	       HttpServletResponse response,Model mv)  throws Throwable { 
		page.autoComplete(mv);
		page.HeaderInfo(request, mv);
	   int pageSize= 10;
	   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	   String pageNum = request.getParameter("pageNum");
	   if (pageNum == null || pageNum =="") {
	      pageNum = "1";
	   }
	   int currentPage = Integer.parseInt(pageNum);
	   int startRow = (currentPage - 1) * pageSize + 1;  
	   
	   int endRow = currentPage * pageSize;
	   int count = 0;
	   int number = 0;
	   List memberList = null;
	   MemberDAO dbPro = MemberDAO.getInstance();
	   count = dbPro.getMemberCount();
	   //게시판에 있는 글 수 count
	   if (count > 0) {
	      memberList = dbPro.getMembers(startRow, endRow);
	   }
	   number = count - (currentPage - 1) * pageSize;
	   int bottomLine = 3; 
	   int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
	   int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine; //곱셈, 나눗셈먼저.
	   int endPage = startPage + bottomLine -1;
	   
	   if (endPage > pageCount) endPage = pageCount;
	   
	 
	   request.setAttribute("count", count);
	  
	   request.setAttribute("memberList",memberList);
	   request.setAttribute("number",number);
	   request.setAttribute("startPage", startPage);
	   request.setAttribute("bottomLine", bottomLine);
	   request.setAttribute("pageCount", pageCount);
	   request.setAttribute("currentPage", currentPage);
	   request.setAttribute("endPage", endPage);
	   
	       return "/member/member_List"; 
	      } 

 @RequestMapping("/member_deletead")    //form 
 public String member_deletead(HttpServletRequest req, HttpServletResponse res)  throws Throwable {
 
		String memberid=req.getParameter("memberid");
		String passwd = req.getParameter("passwd");
		
		MemberDAO dbPro=MemberDAO.getInstance();
		int chk=dbPro.deleteMember(memberid, passwd);
		
		
		req.setAttribute("memberid",memberid);
		req.setAttribute("chk", chk);
 

 
 return "member/member_deletead";
}

 
 @RequestMapping("/study_List")
 public String study_List(HttpServletRequest request,
	       HttpServletResponse response)  throws Throwable { 
 
 
	 int pageSize= 10;
	   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	   String pageNum = request.getParameter("pageNum");
	   if (pageNum == null || pageNum =="") {
	      pageNum = "1";
	   }
	   int currentPage = Integer.parseInt(pageNum);
	   int startRow = (currentPage - 1) * pageSize + 1;  
	   
	   int endRow = currentPage * pageSize;
	   int count = 0;
	   int number = 0;
	   List studyList = null;
	   StudyDAO dbPro = StudyDAO.getInstance();
	   count = dbPro.getStudyCount();
	   //게시판에 있는 글 수 count
	   if (count > 0) {
	      studyList = dbPro.getStudyList(startRow, endRow);
	   }
	   number = count - (currentPage - 1) * pageSize;
	   int bottomLine = 3; 
	   int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
	   int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine; //곱셈, 나눗셈먼저.
	   int endPage = startPage + bottomLine -1;
	   
	   if (endPage > pageCount) endPage = pageCount;
	   
	 
	   request.setAttribute("count", count);
	  
	   request.setAttribute("studyList",studyList);
	   request.setAttribute("number",number);
	   request.setAttribute("startPage", startPage);
	   request.setAttribute("bottomLine", bottomLine);
	   request.setAttribute("pageCount", pageCount);
	   request.setAttribute("currentPage", currentPage);
	   request.setAttribute("endPage", endPage);
	   
 
 
 
 return "member/study_List";


}
 
 @RequestMapping("/study_delete")    //form 
 public String study_delete(HttpServletRequest req, HttpServletResponse res)  throws Throwable {
 
		String studyName=req.getParameter("studyName");
		
		
		StudyDAO dbPro=StudyDAO.getInstance();
		int chk=dbPro.deleteStudy(studyName);
		
		   
		req.setAttribute("studyName",studyName);
		
		req.setAttribute("chk", chk);

 
 return "member/study_delete";
}
 
}
