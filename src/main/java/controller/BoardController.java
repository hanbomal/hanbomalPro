package controller;

import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import dao.BoardDAO;
import model.BoardTypeVO;
import model.BoardVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	// get Session ID Method
	public String getSessionId(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String memberid = (String) session.getAttribute("memberid");
		if (memberid == null) {
			memberid = "";
		}
		return memberid;
	}
	BoardDAO boardDB = BoardDAO.getInstance();
	
	String boardid = "1";
	String pageNum = "1";
	String group="1";

	@ModelAttribute
	public void addAttributes(String pageNum, String group) {
		if (pageNum != null && pageNum != "")
			this.pageNum = pageNum;
		if (group != null)
			this.group = group;
	}
	
	@RequestMapping("/study_board")
	public String study_board(Model mv,HttpServletRequest req, String boardid, String studynum) throws Throwable {
		
		int pageSize = 7;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		List articleList = null;
		BoardDAO dbPro = BoardDAO.getInstance();
		count = dbPro.getArticleCount(boardid,studynum);
		if (count > 0) {
			articleList = dbPro.getArticles(startRow, endRow, boardid,studynum);
		}
		number = count - (currentPage - 1) * pageSize;
		
		int bottomLine = 5;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		BoardTypeVO boardType=boardDB.getBoardType(boardid,studynum);
		String memberid=getSessionId(req);
		mv.addAttribute("boardType",boardType);	
		mv.addAttribute("boardid",boardid);
		mv.addAttribute("studynum",studynum);
		mv.addAttribute("pageCount",pageCount);
		mv.addAttribute("endPage",endPage);
		mv.addAttribute("bottomLine",bottomLine);
		mv.addAttribute("startPage",startPage);
		mv.addAttribute("currentPage",currentPage);
		mv.addAttribute("articleList",articleList);
		mv.addAttribute("number",number);
		mv.addAttribute("count",count);
		mv.addAttribute("memberid",	memberid);
		
		
		return "board/study_board";
	}
	/*content?num=${article.num}&pageNum=${currentPage }&boardid=${article.boardid}&studynum=${article.studynum }'*/
	@RequestMapping("/content")
	public String content(Model mv, int num,String boardid, String studynum) throws Throwable {
		BoardVO article = boardDB.getArticle(num, studynum,boardid,"content");
		BoardTypeVO boardType=boardDB.getBoardType(boardid,studynum);
		mv.addAttribute("boardType",boardType);
		mv.addAttribute("article", article);
		mv.addAttribute("num", num);
		mv.addAttribute("pageNum", pageNum);
		return "board/content";
	}
	
	@RequestMapping("/updateForm")
	public String updateForm(int num,String boardid, String studynum, Model mv) throws Exception  {
			BoardVO article = boardDB.getArticle(num,studynum, boardid, "update");
			BoardTypeVO boardType=boardDB.getBoardType(article.getBoardid(),article.getStudynum());
			mv.addAttribute("boardType",boardType);
			mv.addAttribute("article", article);
			mv.addAttribute("boardid", article.getBoardid());
			mv.addAttribute("ref", article.getRef());
			mv.addAttribute("re_step", article.getRe_step());
			mv.addAttribute("re_level", article.getRe_level());
			mv.addAttribute("studynum", article.getStudynum());
			mv.addAttribute("num", article.getNum());
			mv.addAttribute("pageNum", pageNum);
		return "board/updateForm";
	}
	@RequestMapping(
		      value = "/updatePro"
		      , method= RequestMethod.POST
		      , consumes ={"multipart/form-data"}
		)
	public String updatePro(MultipartHttpServletRequest request,BoardVO article, Model mv) throws Exception {
		MultipartFile multi = request.getFile("uploadfile");
		String filename = multi.getOriginalFilename();
		System.out.println("filename:[" + filename + "]");
		if (filename != null && !filename.equals("")) {
			String uploadPath = request.getRealPath("/") + "fileSave";
			System.out.println(uploadPath);
			FileCopyUtils.copy(multi.getInputStream(),
					new FileOutputStream(uploadPath + "/" + multi.getOriginalFilename()));
			article.setFilename(filename);
			article.setFilesize((int) multi.getSize());
		} else {
			article.setFilename("");
			article.setFilesize(0);
		}
		int updateCount=boardDB.updateArticle(article);
		mv.addAttribute("updateCount", updateCount);
		mv.addAttribute("pageNum", pageNum);
		mv.addAttribute("studynum",article.getStudynum());
		mv.addAttribute("boardid",article.getBoardid());
		return "redirect:/board/study_board";
	}
	
	@RequestMapping("/deletePro")
	public String deletePro(int num,String boardid, String studynum,Model mv) throws Throwable {
		int deleteCount=boardDB.deleteArticle(num, boardid,studynum);
		mv.addAttribute("deleteCount",deleteCount);
		mv.addAttribute("pageNum",pageNum);
		mv.addAttribute("studynum",studynum);
		mv.addAttribute("boardid",boardid);
		return "redirect:/board/study_board";
	}
	
	@RequestMapping("/writeForm")
	public ModelAndView writeForm(BoardVO article,HttpServletRequest req) throws Exception {
		ModelAndView mv = new ModelAndView();
		String memberid=getSessionId(req);
		BoardTypeVO boardType=boardDB.getBoardType(article.getBoardid(),article.getStudynum());
		mv.addObject("boardType",boardType);
		if(boardid==null||boardid.equals("")) {
			boardid="1";
		}
		mv.addObject("boardid", article.getBoardid());
		mv.addObject("boardType",boardType);
		mv.addObject("num", article.getNum());
		mv.addObject("ref", article.getRef());
		mv.addObject("re_step", article.getRe_step());
		mv.addObject("re_level", article.getRe_level());
		mv.addObject("pageNum", pageNum);
		mv.addObject("memberid", memberid);
		mv.addObject("studynum",article.getStudynum());
		mv.setViewName("board/writeForm");
		return mv;
	}

	@RequestMapping(
		      value = "/writePro"
		      , method= RequestMethod.POST
		      , consumes ={"multipart/form-data"}
		)
	public String writePro(MultipartHttpServletRequest request,BoardVO article, Model mv)throws Exception {
		MultipartFile multi = request.getFile("uploadfile");
		String filename = multi.getOriginalFilename();
		System.out.println("filename:[" + filename + "]");
		if (filename != null && !filename.equals("")) {
			String uploadPath = request.getRealPath("/") + "fileSave";
			System.out.println(uploadPath);
			FileCopyUtils.copy(multi.getInputStream(),
					new FileOutputStream(uploadPath + "/" + multi.getOriginalFilename()));
			article.setFilename(filename);
			article.setFilesize((int) multi.getSize());
		} else {
			article.setFilename("");
			article.setFilesize(0);
		}
		boardDB.insertArticle(article);
		mv.addAttribute("pageNum", pageNum);
		mv.addAttribute("studynum", article.getStudynum());
		mv.addAttribute("boardid", article.getBoardid());
		return "redirect:/board/study_board";
	}
	
	
	/*@ResponseBody
	@RequestMapping(value="loadArticle",
	produces="application/String; charset=utf-8",
	method=RequestMethod.POST)
	public String checkid(String id,String group,String boardid) { 
        //자동적으로 넘어옴(id는 넘겨받은 parameter값의 name과 같아야됨
		System.out.println("id:"+id);
		
		BoardVO article=boardDB.getArticle(Integer.parseInt(id), group, boardid, "");
		
		return article.toString();
	}*/
	
	@ResponseBody
	@RequestMapping(value = "loadArticle", method = RequestMethod.GET, produces="application/json")
	public List< Map< String, Object>> ajax_receiveJSON() {
	   
	 
	   
		
	 List< Map< String, Object>> list = new ArrayList< Map< String, Object>>();
	   
	 for(int i=0 ; i<3 ; i++) {
	    
	  Map< String, Object> map = new HashMap< String, Object>();
	    
	  map.put("id", "id"+i);
	  map.put("name", "name"+i);
	    
	  list.add(map);
	 }
	   
	 return list;    
	} 
	
	

}
