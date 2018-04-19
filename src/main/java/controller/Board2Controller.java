package controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.Board2DAO;

@Controller
@RequestMapping("/board2")
public class Board2Controller {
	
	
	
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
		   Board2DAO dbPro =  Board2DAO.getInstance();
		   count = dbPro.getArticleCount();
		   //게시판에 있는 글 수 count
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
	 
	
		int num=0, ref=0, re_step=0, re_level=0;
	  	
		
		
		
		if (req.getParameter("num")!=null) {
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
	
}