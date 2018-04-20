package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

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
	 public ModelAndView board2_Write(Board2VO article)  throws Throwable { 
	 
	
		ModelAndView mv = new ModelAndView();
	

		

		mv.addObject("num", article.getNum());
		mv.addObject("ref", article.getRef());
		mv.addObject("re_step", article.getRe_step());
		mv.addObject("re_level", article.getRe_level());
		mv.addObject("pageNum", pageNum);
		mv.setViewName("board2/board2_Write");
		
		
		
		 return mv;
}
	
	@RequestMapping("/board2_WritePro")
	 public String board2_WritePro(MultipartHttpServletRequest request,Board2VO article, Model model)  throws Throwable { 
		
			
		ModelAndView mv = new ModelAndView();
		MultipartFile multi = request.getFile("uploadfile");
		String filename = multi.getOriginalFilename();
		System.out.println("filename:["+filename+"]");
		
		if (filename != null && !filename.equals("")) {
			String uploadPath = request.getRealPath("/")+"fileSave2"; 
			System.out.println(uploadPath);
			FileCopyUtils.copy(multi.getInputStream(), new FileOutputStream(uploadPath+"/"+multi.getOriginalFilename()));
			article.setFilename(filename);
			article.setFilesize((int)multi.getSize());
		} else {
			article.setFilename("");
			article.setFilesize(0);
		}
		
		
		dbPro.insertArticle(article);
		model.addAttribute("pageNum",pageNum);
		
		return "redirect:board2_List";
		}
		
	
	@RequestMapping("/board2_content")
	public String content (int num, Model model) throws Exception {
		
		Board2VO article = dbPro.getArticle(num);
		
	
		
		
		model.addAttribute("article", article);
		model.addAttribute("pageNum", pageNum);	
	
	
		return "board2/board2_content";
		
	}
		
	@RequestMapping("/board2_update")
	public String board2_update(int num, Model model) throws Exception {
		
		
			
		Board2VO article = dbPro.getArticle(num);
		
		
		model.addAttribute("article", article);
		model.addAttribute("pageNum", pageNum);
	
		
		
		
		return "board2/board2_update";
	
	}	
	
	@RequestMapping("/board2_updatePro")
	public String updatePro(Board2VO article, Model model) throws Exception {
		int chk = dbPro.updateArticle(article);
		
		model.addAttribute("chk", chk);
		model.addAttribute("pageNum", pageNum);
		
		return "redirect:board2_List";
	}
		
	
	@RequestMapping(value = "/board2_deletePro")
	public ModelAndView board2_deletePro(int num) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("num", num);
	
		int check = dbPro.deleteArticle(num);
		mv.addObject("check", check);
		mv.addObject("pageNum",pageNum);
		mv.setViewName("board2/board2_deletePro");
		
		return mv;
	}
		
		
		

		
		
	}
	
	
	
	
