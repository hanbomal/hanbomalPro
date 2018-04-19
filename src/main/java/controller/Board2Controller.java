package controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


import dao.Board2DAO;
import model.Board2VO;

@Controller
@RequestMapping("/board2")
public class Board2Controller {
	
	public String getSessionId(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String writer = (String) session.getAttribute("memberid");
		if (writer == null) {
			writer = "";
		}
		return writer;
	}
	
	Board2DAO dbPro=Board2DAO.getInstance();
	String pageNum = "1";
	@ModelAttribute
	public void addAttributes(String pageNum, String group) {
		if (pageNum != null && pageNum != "")
			this.pageNum = pageNum;
	
	}
	
	
	
	@RequestMapping("/board2_List")
	 public String board2_List(HttpServletRequest request,
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
		   List board2List = null;
		 
		   count = dbPro.getArticleCount();
		   //�Խ��ǿ� �ִ� �� �� count
		   if (count > 0) {
			   board2List = dbPro.getArticles(startRow, endRow);
		   }
		   number = count - (currentPage - 1) * pageSize;
		   int bottomLine = 3; 
		   int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		   int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine; 
		   int endPage = startPage + bottomLine -1;
		   
		   if (endPage > pageCount) endPage = pageCount;
		   
		 
		   request.setAttribute("count", count);
		  
		   request.setAttribute("board2List",board2List);
		   request.setAttribute("number",number);
		   request.setAttribute("startPage", startPage);
		   request.setAttribute("bottomLine", bottomLine);
		   request.setAttribute("pageCount", pageCount);
		   request.setAttribute("currentPage", currentPage);
		   request.setAttribute("endPage", endPage);
		   
	 
	
	 
	 return "board2/board2_List";


	}
	
	@RequestMapping("/board2_Write")
	 public String board2_Write(HttpServletRequest req,
		       HttpServletResponse response)  throws Throwable { 
	 
	
		int num = 0, ref = 0, re_step = 0, re_level = 0;
	

		

		if (req.getParameter("num") != null) {
			num = Integer.parseInt(req.getParameter("num"));
			ref = Integer.parseInt(req.getParameter("ref"));
			re_step = Integer.parseInt(req.getParameter("re_step"));
			re_level = Integer.parseInt(req.getParameter("re_level"));

		}

		req.setAttribute("num", num);
		req.setAttribute("ref", ref);
		req.setAttribute("re_step", re_step);
		req.setAttribute("re_level", re_level);
		req.setAttribute("pageNum", 1);
	
	
	 
		
		
		
		 return "board2/board2_Write";
}
	
	@RequestMapping("/board2_WritePro")
	 public String board2_WritePro(HttpServletRequest req,
		       HttpServletResponse res)  throws Throwable { 
		
			
		String realFolder = "";// 
		String encType = "euc-kr"; //
		int maxSize = 5 * 1024 * 1024; // 
		ServletContext context = req.getServletContext();
		realFolder = context.getRealPath("fileSaveh");
		MultipartRequest multi = null;
		multi = new MultipartRequest(req, realFolder, maxSize, encType,
			new DefaultFileRenamePolicy());
		Enumeration files = multi.getFileNames();
		String filename = "";
		File file = null;
		if (files.hasMoreElements()) {
			String name = (String) files.nextElement();
			filename = multi.getFilesystemName(name);
			String original = multi.getOriginalFileName(name);
			String type = multi.getContentType(name);
			file = multi.getFile(name);	}
		
		String pageNum = multi.getParameter("pageNum");
		
		if (pageNum == null || pageNum == "") pageNum = "1";
		Board2VO article = new Board2VO();
		if (multi.getParameter("num") != null
		&& !multi.getParameter("num").equals("")) {
		article.setNum(Integer.parseInt(multi.getParameter("num")));
		article.setRef(Integer.parseInt(multi.getParameter("ref")));
		article.setRe_step(Integer.parseInt(multi.getParameter("re_step")));
		article.setRe_level(Integer.parseInt(multi.getParameter("re_level")));
		}article.setWriter(multi.getParameter("writer"));
	
		article.setSubject(multi.getParameter("subject"));
	
		article.setContent(multi.getParameter("content"));
	
		if (file != null)	{
			article.setFilename(filename);
			article.setFilesize((int) file.length());
		}
		else {
			article.setFilename(" ");
			article.setFilesize(0);
		}
		
		
		
		
		
		
		System.out.println(article);
		
		dbPro.insertArticle(article);
		req.setAttribute("pageNum", pageNum);
		res.sendRedirect(req.getContextPath()+"board2/board2_list?pageNum="+pageNum);
			return null;
		}
		
		
	}
	
	
	
	
