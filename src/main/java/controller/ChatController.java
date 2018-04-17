package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import chat.Chatdata;
import dao.GalleryDAO;
import dao.RelationDAO;
import dao.StudyDAO;
import model.GalleryVO;
import model.RelationVO;

@Controller
@RequestMapping("/chatcontroller")
public class ChatController {
	GalleryDAO gPro = GalleryDAO.getInstance();
	RelationDAO rPro=RelationDAO.getInstance();
	StudyDAO sPro=StudyDAO.getInstance();
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	String datetext = sdf.format(date);

	@RequestMapping("/intro")
	public String intro(HttpServletRequest req, HttpServletResponse res,String group, String name, Model mv) throws Throwable {
		req.setAttribute("group", group);
		req.setAttribute("name", name);
		
		String cid = group; 

		String rootDirPath = "C:\\save\\" + cid;

		File rootDir = null;
		List<String> files = new ArrayList<String>();
		Charset cs = StandardCharsets.UTF_8;
	
		List<Chatdata> chatd = new ArrayList<Chatdata>();
		String lastday="";
		
		try {
			
			
			rootDir = new File(rootDirPath);
			

			   if(!rootDir.exists())
				   rootDir.mkdirs();
			
			
			File[] rootDirs = rootDir.listFiles();

		// 3일치 파일 가져오기
		if (rootDirs.length >= 3) {
			for (int i = rootDirs.length - 3; i < rootDirs.length; i++) {
				files.add(rootDirs[i].getPath());
				
				if(i==rootDirs.length-1) {
					lastday=rootDirs[i].getName().replace(cid+"_", "");
				}
			}
			// 파일이 3일치 이하인 경우
		} else {
			
			for (int i = 0; i < rootDirs.length; i++) {
				files.add(rootDirs[i].getPath());
				
				if(i==rootDirs.length-1) {
					lastday=rootDirs[i].getName().replace(cid+"_", "");
				}
			}
			
			}
		
		if(rootDirs.length==0) {
			req.setAttribute("isEmpty", "true");
		}else {
			req.setAttribute("isEmpty", "false");
		}
		

		for (String logPath : files) {

			File file = new File(logPath);

			if (file.exists()) {

				
				Path path = Paths.get(logPath);
				List<String> list = new ArrayList<String>();
				list = Files.readAllLines(path, cs);

					for (String readLine : list) {
						readLine.trim();
						 
						
						if (readLine.substring(1,8).equals("=======")) {
							Chatdata cd = new Chatdata();
							cd.setName("server");
							cd.setDate("server");
							String str=readLine.substring( readLine.indexOf("[")+1, readLine.indexOf("]") );
							
							cd.setContent(str.trim());
							chatd.add(cd);
							
						} else {
							
							
							String[] tmp = readLine.substring(readLine.indexOf("[") + 1, readLine.lastIndexOf("]"))
									.split("\\]" + " " + "\\[");
							List tmplist = new ArrayList();
							
							
								for (int i = 0; i < tmp.length; i++) {
										tmplist.add(tmp[i]);
									}
								if (tmp.length == 2) {
										tmplist.add("");
									}

							Chatdata cd = new Chatdata();
							cd.setName((String) tmplist.get(0));
							cd.setDate((String) tmplist.get(1));
							cd.setContent((String) tmplist.get(2));

							chatd.add(cd);
						}

					}
				}
			}
		} catch (IOException e) {
			e.printStackTrace();}
		
		/*System.out.println(datetext);
		System.out.println(lastday.substring(0, lastday.indexOf(".")));*/
		req.setAttribute("chatdata", chatd);
		req.setAttribute("today", datetext);
		String lastdayText="";
		
		if(!lastday.equals("")) {
		lastdayText=lastday.substring(0, lastday.indexOf("."));}else {
			lastdayText=datetext;
		}
		
		req.setAttribute("lastday", lastdayText);
		
		
		String groupName=sPro.getOneStudy(group).getStudyName();
		List<RelationVO> memberList=rPro.getJoinMemberListForChat(groupName);
		//System.out.println(groupName);
		//System.out.println(memberList.get(0).getNickName());
		
		HashMap<String,String> namemap=new HashMap<String,String>();
		Set<String> nameset=new HashSet<String>();
		
		
		Iterator<RelationVO> it=memberList.iterator();
		while(it.hasNext()) {
			RelationVO member=(RelationVO)it.next();
			String username=member.getMemberId();
			nameset.add(username);
			
			if(member.getStatus()=="2") {
			
				if((member.getPhoto()!="")&&(member.getPhoto()!=null)) {
					
					namemap.put(username,req.getContextPath()+"/fileSave/"+member.getPhoto());
					nameset.add(username+","+req.getContextPath()+"/fileSave/"+member.getPhoto());
					//System.out.println(req.getContextPath()+"/fileSave/"+member.getPhoto());
				}
				
				else {
					namemap.put(username,req.getContextPath()+"/imgs/profile.png");
					nameset.add(username+","+req.getContextPath()+"/imgs/profile.png");
					
					
					//System.out.println(req.getContextPath()+"/imgs/profile.png");
				}
			
			}else {
				namemap.put(username,req.getContextPath()+"/imgs/Xprofile.png");
			}
		}
		
		
	        Set<String> set = namemap.keySet();
	        Object obj[] = set.toArray();

	        StringBuffer stbf = new StringBuffer();
	       // stbf.append("<script type='text/javascript'>");
	        stbf.append("var map = new Array();");
	        for(int i=0; i<obj.length; i++)
	        {
	            if(i!=0)stbf.append("");
	            stbf.append("map['"+obj[i]+"'] = '"+namemap.get(obj[i])+"';");
	        }
	        //stbf.append("</script>");

		
	   
	    mv.addAttribute("nameJs",stbf);
		mv.addAttribute("nameMap",namemap);
		mv.addAttribute("memberList",memberList);
		mv.addAttribute("nameset",nameset);
		
		return "chat/websocketGroup";

	}

	
	@RequestMapping(value = "/fileUpload", method = RequestMethod.POST, consumes = { "multipart/form-data" })
	public String fileUpload(MultipartHttpServletRequest request, GalleryVO gallery, String studynum, String name,
			Model model) throws Exception {

		MultipartFile multi = request.getFile("uploadfile");

		String filename = multi.getOriginalFilename();
		System.out.println("filename:[" + filename + "]");
		if (filename != null && !filename.equals("")) {
			String uploadPath = request.getRealPath("/") + "fileSave";
			System.out.println(uploadPath);

			String fileType = filename.substring(filename.lastIndexOf('.'), filename.length());
			String rename = gallery.getName() + "_" + System.currentTimeMillis() + fileType;
			FileCopyUtils.copy(multi.getInputStream(), new FileOutputStream(uploadPath + "/" + rename));

			gallery.setFilename(rename);
			gallery.setFilesize((int) multi.getSize());
			model.addAttribute("filename", rename);
		} else {

			gallery.setFilename("");
			gallery.setFilesize(0);
		}
		// 나중에수정할부분들

		gallery.setTitle(gallery.getName() + "님이 올린 사진");

		System.out.println(gallery);

		gPro.addGallery(gallery);

		return "chat/uploadComp";
	}

}
