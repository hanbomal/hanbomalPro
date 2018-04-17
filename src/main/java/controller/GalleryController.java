package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.GalleryDAO;
import model.GalleryVO;

@Controller
@RequestMapping("/gallery")
public class GalleryController {
	GalleryDAO gPro=GalleryDAO.getInstance();
	String studynum = "1";
	String pageNum = "1";
	String memberid="aaa";
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	@ModelAttribute
	public void addAttributes(String studynum, String pageNum, String memberid) {
		if (studynum != null)
			this.studynum = studynum;
		if (pageNum != null && pageNum != "")
			this.pageNum = pageNum;
		if (memberid != null && memberid != "")
			this.memberid = memberid;
		
	}
	
	public String getSessionId(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String memberid = (String) session.getAttribute("memberid");
		if (memberid == null) {
			memberid = "defaultID";
		}
		return memberid;
	}
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request, Model model) throws Exception {
		int pageSize = 8;
		
		
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		List galleryList = null;
		count = gPro.getGalleryCount(studynum);
		if (count > 0) {
			galleryList = gPro.getImages(startRow, endRow, studynum);

			for(Object gallery:galleryList) {
				GalleryVO tmp=(GalleryVO)gallery;
				tmp.setFormatDate(sdf.format(tmp.getRegdate()));
			}
		}
		number = count - (currentPage - 1) * pageSize;

		int bottomLine = 5;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;
		if (endPage > pageCount)
			endPage = pageCount;

		model.addAttribute("studynum", studynum);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("endPage", endPage);
		model.addAttribute("bottomLine", bottomLine);
		model.addAttribute("startPage", startPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("sdf", sdf);
		model.addAttribute("galleryList", galleryList);
		model.addAttribute("number", number);
		model.addAttribute("count", count);
		model.addAttribute("memberid", memberid);
		
		
		
		return "gallery/study_gallery";
	}
	
	@RequestMapping(
		      value = "/imageView"
		      , method= RequestMethod.POST
		  		)
	public String imageView(HttpServletRequest request, Model model)
			throws Exception {
		
		String num=request.getParameter("num");
		String memberid=request.getParameter("memberid");
		
		GalleryVO gallery=gPro.getImage(num);
		
		gallery.setFormatDate(sdf.format(gallery.getRegdate()));
		
		model.addAttribute("gallery",gallery);
		model.addAttribute("memberid",memberid);
		
		
		return "gallery/viewPage";
	}
	
	@RequestMapping(
		      value = "/deleteImage"
		      , method= RequestMethod.POST
		  		)
	public String deleteImage(HttpServletRequest request)
			throws Exception {
		
		String num=request.getParameter("num");
		
		GalleryVO gallery=gPro.getImage(num);
		
		
		
		gallery.setFilesize(0);
		gallery.setTitle("삭제된 사진");
		gallery.setContent("삭제된 사진입니다.");
		
		gPro.updateGallery(gallery);
		
		
		String path = request.getRealPath("/") + "fileSave/deletedImage.png";
		String path2=request.getRealPath("/") + "fileSave/"+gallery.getFilename();
		File srcFile = new File(path);
		FileInputStream fis=new FileInputStream(srcFile);
		File desFile=new File(path2);
		FileOutputStream fos=new FileOutputStream(desFile);

		byte[] b = new byte[(int)srcFile.length()];
		fis.read(b);
		fos.write(b);

		fis.close();
		fos.close();
		
		System.out.println("완료");
		
		
		return "gallery/study_gallery";
		
	}
	
}
