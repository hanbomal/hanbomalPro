package controller;

import java.io.FileOutputStream;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import dao.BoardDAO;
import dao.RelationDAO;
import dao.StudyDAO;
import model.BoardTypeVO;
import model.PositionVO;
import model.RelationVO;
import model.StudyVO;

@Controller
@RequestMapping("/page")
public class PageController {
	RelationDAO relationDB = RelationDAO.getInstance();
	StudyDAO studyDB = StudyDAO.getInstance();
	BoardDAO boardDB = BoardDAO.getInstance();
	String pageNum = "1";
	String group="1";
	String boardid = "1";
	String workspaceTitle="WORKSPACE";

	@ModelAttribute
	public void addAttributes(String boardid,String group,String pageNum) {
		if (boardid != null)
			this.boardid = boardid;
		if (pageNum != null && pageNum != "")
			this.pageNum = pageNum;
		if (group != null)
			this.group = group;
	}
	
	public void HeaderInfo(HttpServletRequest req,Model mv) {
		List<StudyVO> groupList=studyDB.getGroupList(getSessionId(req));
		int reqcount = relationDB.requestCount(getSessionId(req));
		int rescount = relationDB.responseCount(getSessionId(req));
		
		mv.addAttribute("groupList",groupList);
		mv.addAttribute("reqcount",reqcount);
		mv.addAttribute("rescount",rescount);
	}
	
	// autoComplete Method
	public void autoComplete(Model mv) throws Throwable {
		// auto_complete
		List<StudyVO> allList = studyDB.getAllStudy();
		String nameList = "";
		for (StudyVO study : allList) {
			nameList += "\"" + study.getStudyName() + "\",";
		}
		mv.addAttribute("nameList", nameList);
	}

	// get Session ID Method
	public String getSessionId(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String memberid = (String) session.getAttribute("memberid");
		if (memberid == null) {
			memberid = "defaultID";
		}
		return memberid;
	}
	public String getSessionNick(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String nickname=(String) session.getAttribute("nickname");
		if (nickname == null) {
			nickname = "defaultNickname";
		}
		return nickname;
	}

	@RequestMapping("/main")
	public String main(Model mv, String studyName,HttpServletRequest req, String chk) throws Throwable {
		autoComplete(mv);
		HeaderInfo(req, mv);
		if (studyName == null) {
			studyName = "defaultName";
		}
		if(chk==null) {
			chk="";
		}
		String memberid = getSessionId(req);
		List<StudyVO> group = studyDB.resultList(studyName, memberid, chk);
		mv.addAttribute("group", group);
		mv.addAttribute("studyName", studyName);
		mv.addAttribute("chk",chk);
		return "page/main";
	}

	@RequestMapping("/requestJoin")
	public String requestJoin(String reqNum,String correctName,
			HttpServletRequest req,String studyName,String leader,String chk) throws Throwable {
		RelationDAO dbPro = RelationDAO.getInstance();
		if (reqNum == null) {
			reqNum = "";
		}
		if (reqNum.equals("1")) {
			dbPro.requestJoin(getSessionId(req),group,correctName, getSessionNick(req), leader);
			studyName = URLEncoder.encode(studyName, "UTF-8");
			return "redirect:/page/main?&studyName="+ studyName+"&chk="+chk;
		}
		return null;
	}

	@RequestMapping("/cancelJoin")
	public String cancelJoin(HttpServletRequest req, HttpServletResponse res,
			String studyName, String correctName, String chk) throws Throwable {
		String delNum = req.getParameter("delNum");
		if (delNum == null) {
			delNum = "";
		}
		if (delNum.equals("1")) {
			relationDB.cancelJoin(getSessionId(req), correctName);
			studyName = URLEncoder.encode(studyName, "UTF-8");
			return "redirect:/page/main?studyName="+ studyName+"&chk="+chk ;
		}
		return null;
	}
	
	
	@RequestMapping("/makingPro")
	public String makingPro(MultipartHttpServletRequest req,  
			String studyName, String study_intro, Model mv) throws Throwable {
		autoComplete(mv);
		StudyVO  study = new StudyVO();
		MultipartFile multi1 = req.getFile("study_pro");
		MultipartFile multi2 = req.getFile("study_back");
		String pro_name = multi1.getOriginalFilename();
		String back_name = multi2.getOriginalFilename();
		if (pro_name != null && !pro_name.equals("")) {
			String uploadPath = req.getRealPath("/") + "fileSave";
			FileCopyUtils.copy(multi1.getInputStream(),
					new FileOutputStream(uploadPath + "/" + multi1.getOriginalFilename()));
			study.setStudy_pro(pro_name);
			study.setProSize((int) multi1.getSize());
		} else {
			study.setStudy_pro("");
			study.setProSize(0);
		}
		if (back_name != null && !back_name.equals("")) {
			String uploadPath = req.getRealPath("/") + "fileSave";
			FileCopyUtils.copy(multi2.getInputStream(),
					new FileOutputStream(uploadPath + "/" + multi2.getOriginalFilename()));
			study.setStudy_back(back_name);
			study.setBackSize((int) multi2.getSize());
		} else {
			study.setStudy_back("");
			study.setBackSize(0);
		}
		study.setStudyName(studyName);
		study.setStudy_intro(study_intro);
		study.setPeopleCount(1);
		study.setLeader(getSessionId(req));
		studyDB.makingStudy(study,getSessionNick(req));
		return "redirect:/page/main";
	}

	@RequestMapping("/about")
	public String about(HttpServletRequest req, HttpServletResponse res, Model mv) throws Throwable {
		autoComplete(mv);
		HeaderInfo(req, mv);
		return "page/about";
	}
	
	@RequestMapping("/RequestPage")
	public String RequestPage(Model mv,HttpServletRequest req) throws Throwable {
		autoComplete(mv);
		HeaderInfo(req, mv);
		
		int pageSize = 8;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		List<RelationVO> reqList =null;
		count = relationDB.requestCount(getSessionId(req));
		if (count > 0) {
			reqList=relationDB.requestList(startRow,endRow,getSessionId(req));
		}
		number = count - (currentPage - 1) * pageSize;
		int bottomLine = 5;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;
		if (endPage > pageCount)
			endPage = pageCount;

		mv.addAttribute("studynum", group);
		mv.addAttribute("pageCount", pageCount);
		mv.addAttribute("endPage", endPage);
		mv.addAttribute("bottomLine", bottomLine);
		mv.addAttribute("startPage", startPage);
		mv.addAttribute("currentPage", currentPage);
		mv.addAttribute("reqList", reqList);
		mv.addAttribute("number", number);
		mv.addAttribute("count", count);
		mv.addAttribute("memberid", getSessionId(req));
		
		return "page/RequestPage";
	}
	
	@RequestMapping("/ResponsePage")
	public String ResponsePage(Model mv,HttpServletRequest req) throws Throwable {
		autoComplete(mv);
		HeaderInfo(req, mv);
		int pageSize = 8;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		List<RelationVO> resList =null;
		count = relationDB.responseCount(getSessionId(req));
		if (count > 0) {
			resList=relationDB.responseList(startRow,endRow,getSessionId(req));
		}
		number = count - (currentPage - 1) * pageSize;
		int bottomLine = 5;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;
		if (endPage > pageCount)
			endPage = pageCount;

		mv.addAttribute("studynum", group);
		mv.addAttribute("pageCount", pageCount);
		mv.addAttribute("endPage", endPage);
		mv.addAttribute("bottomLine", bottomLine);
		mv.addAttribute("startPage", startPage);
		mv.addAttribute("currentPage", currentPage);
		mv.addAttribute("resList", resList);
		mv.addAttribute("number", number);
		mv.addAttribute("count", count);
		mv.addAttribute("memberid", getSessionId(req));
		
		
		return "page/ResponsePage";
	}
	@RequestMapping("/sendRedirect")
	public String sendRedirect(Model mv,HttpServletRequest req
			,String memberId, String yes,String no, String studyName) throws Throwable {
		autoComplete(mv);
		String leader = getSessionId(req);
		if(yes==null) yes="";
		if(no==null) no="";
		if(yes.equals("yes")) {
			relationDB.answerYes(memberId, leader,studyName);
		}else if(no.equals("no")) {
			relationDB.answerNo(memberId, leader,studyName);
		}
		HeaderInfo(req, mv);
		return "redirect:/page/ResponsePage";
	}
	@RequestMapping("/study_album")
	public String study_album(HttpServletRequest req, HttpServletResponse res,Model mv) throws Throwable {
		HeaderInfo(req, mv);
		return "page/study_album";
	}

	@RequestMapping("/study_making")
	public String study_making(HttpServletRequest req, HttpServletResponse res,Model mv) throws Throwable {
		HeaderInfo(req, mv);
		return "page/study_making";
	}
	
	@RequestMapping("/test")
	public String test(HttpServletRequest req,Model mv) throws Throwable {
		autoComplete(mv);
		HeaderInfo(req, mv);
		String memberid=getSessionId(req);
		System.out.println("group_test="+group);
		List<BoardTypeVO> typeList=boardDB.getTypeList(group);
		mv.addAttribute("typeList", typeList);
		mv.addAttribute("memberid",memberid);
		StudyVO study= studyDB.getOneStudy(group);
		mv.addAttribute("study", study);
		mv.addAttribute("group",group);
		
		workspaceTitle=study.getStudyName();
		mv.addAttribute("workspaceTitle",workspaceTitle);
		
		return "page/study_test";
	}
	
	@RequestMapping("/test2")
	public String test2(HttpServletRequest req, HttpServletResponse res,Model mv) throws Throwable {
		autoComplete(mv);
		HeaderInfo(req, mv);
		return "page/study_test2";
	}
	
	@RequestMapping("/study_info")
	public String study_info(HttpServletRequest req, HttpServletResponse res,Model mv) throws Throwable {
		autoComplete(mv);
		HeaderInfo(req, mv);
		String memberid = getSessionId(req);
		
		String studynum=req.getParameter("studynum");
		
		StudyVO study=studyDB.getOneStudy(studynum);
		
		List members=relationDB.getJoinMemberList(study.getNum()+"");
		
		
		mv.addAttribute("members",members);
		mv.addAttribute("study",study);
		mv.addAttribute("memberCount",members.size());
		mv.addAttribute("memberid",memberid);
	
		
		
		return "study/study_info";
	}
	
	@RequestMapping("/addPosition")
	public String addPosition(PositionVO position,Model mv) throws Throwable {
		group=position.getStudynum()+"";
		position.setStudynum(Integer.parseInt(group));
		studyDB.addPosition(position);
		return "redirect:/page/study_admin";
	}
	@RequestMapping("/addBoardType")
	public String addBoardType(BoardTypeVO type, Model mv,HttpServletRequest req) throws Throwable {
		System.out.println("addBoardType[studynum]="+type.getStudynum());
		System.out.println("addBoardType[boardname]="+type.getBoardname());
		List<BoardTypeVO> typeList=boardDB.getTypeList(group);
		mv.addAttribute("typeList", typeList);
		boardDB.addBoard(type);
		BoardTypeVO newBoardType = boardDB.getnewBoardType(group);
		mv.addAttribute("newBoardType",newBoardType);
		
		return "redirect:/page/study_admin";
	}
	@RequestMapping("/updateBoardType")
	public String updateBoardType(BoardTypeVO board) throws Throwable {
		boardDB.updateBoardType(board);
		return "redirect:/page/study_admin";
	}
	@RequestMapping("/deleteBoardType")
	public String deleteBoardType() throws Throwable {
		boardDB.deleteBoard(boardid,group);
		return "redirect:/page/study_admin";
	}
	
	@RequestMapping("/updatePosition")
	public String updatePosition(String groupposition,String id, String studynum,HttpServletRequest req) throws Throwable {
		boardDB.updatePosition(id,groupposition,studynum);
		relationDB.updateMemberPosition(studynum,groupposition,getSessionId(req));
		return "redirect:/page/study_admin";
	}
	@RequestMapping("/deletePosition")
	public String deletePosition(String id,String studynum,HttpServletRequest req) throws Throwable {
		boardDB.deletePosition(id,studynum);
		relationDB.defaultPostion(studynum,getSessionId(req));
		return "redirect:/page/study_admin";
	}
	@RequestMapping("/admin_memberList")
	public String admin_memberList(HttpServletRequest req, HttpServletResponse res,Model mv) throws Throwable {
		int pageSize = 5;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		
		StudyVO study=studyDB.getOneStudy(group);
		List members=null;
		count=study.getPeopleCount();
		if(count>0) {
			members=relationDB.getMemberList(startRow,endRow,study.getStudyName());
		}
		number = count - (currentPage - 1) * pageSize;
		int bottomLine = 5;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		mv.addAttribute("studynum", group);
		mv.addAttribute("pageCount", pageCount);
		mv.addAttribute("endPage", endPage);
		mv.addAttribute("bottomLine", bottomLine);
		mv.addAttribute("startPage", startPage);
		mv.addAttribute("currentPage", currentPage);
		mv.addAttribute("members",members);
		mv.addAttribute("number", number);
		mv.addAttribute("count", count);
		return "study/admin_memberList";
	}
	
	@RequestMapping("/study_admin")
	public String study_admin(HttpServletRequest req, HttpServletResponse res,Model mv) throws Throwable {
		autoComplete(mv);
		HeaderInfo(req, mv);
		
		StudyVO study=studyDB.getOneStudy(group);
		List members=relationDB.getJoinMemberList(study.getStudyName());
		String memberid = getSessionId(req);
		
		List<BoardTypeVO> typeList=boardDB.getTypeList(group);
		mv.addAttribute("typeList",typeList);
		
		BoardTypeVO newBoardType = boardDB.getnewBoardType(group);
		mv.addAttribute("newBoardType",newBoardType);
		
		List<PositionVO> position = studyDB.getAllPosition(group);
		mv.addAttribute("positionList",position);
	
		mv.addAttribute("study",study);
		mv.addAttribute("memberCount",members.size());
		mv.addAttribute("memberid",memberid);
		mv.addAttribute("group",group);
		return "study/study_admin";
	}
	
	@RequestMapping("/study_gallery")
	public String study_gallery(HttpServletRequest req, HttpServletResponse res, Model mv) throws Throwable {
		autoComplete(mv);
		HeaderInfo(req, mv);
		return "gallery/study_gallery";
	}
	
	
	@RequestMapping("/showMyInfo")
	public String showMyInfo(HttpServletRequest req, HttpServletResponse res,Model mv) throws Throwable {
		autoComplete(mv);
		HeaderInfo(req, mv);
		String memberid=req.getParameter("name");
		String group=req.getParameter("group");
		StudyVO study=studyDB.getOneStudy(group);
		RelationVO memberInfo=relationDB.getMemberInfo(group, memberid);
		mv.addAttribute("memberInfo",memberInfo);
		return "study/viewMyInfo";
	}
	
	
	
	@RequestMapping("/boardInfo")
	public String boardInfo(HttpServletRequest req, HttpServletResponse res,Model mv) throws Throwable {
		autoComplete(mv);
		HeaderInfo(req, mv);
		String boardid=req.getParameter("boardid");
		String studynum=req.getParameter("studynum");
		String boardname=req.getParameter("boardname");
		
		mv.addAttribute("boardid",boardid);
		mv.addAttribute("studynum",studynum);
		mv.addAttribute("boardname",boardname);
		
		return "study/viewBoardInfo";
	}
	
	@RequestMapping("/PositionInfo")
	public String PositionInfo(HttpServletRequest req, HttpServletResponse res,Model mv) throws Throwable {
		String id=req.getParameter("positionid");
		String groupposition=req.getParameter("groupposition");
		String studynum=req.getParameter("studynum");
		mv.addAttribute("id",id);
		mv.addAttribute("groupposition",groupposition);
		mv.addAttribute("studynum",studynum);
		return "study/viewPositionInfo";
	}
	
	@RequestMapping("/MemberInfo")
	public String MemberInfo(HttpServletRequest req, HttpServletResponse res,Model mv) throws Throwable {
		
		String leader=req.getParameter("leader");
		String memberid=req.getParameter("memberid");
		String groupposition=req.getParameter("groupposition");
		if(groupposition==null||groupposition.equals("")) {
			groupposition="default";
		}
		String studynum=req.getParameter("studynum");
		String nickName=req.getParameter("nickName");
		List<PositionVO> AllPosition=studyDB.getAllPosition(studynum);
		
		mv.addAttribute("AllPosition",AllPosition);
		mv.addAttribute("leader",leader);
		mv.addAttribute("nickName",nickName);
		mv.addAttribute("memberid",memberid);
		mv.addAttribute("groupposition",groupposition);
		mv.addAttribute("studynum",studynum);
		return "study/viewMemberInfo";
	}
	
	
	
	@RequestMapping(value = "/profileChange", method = RequestMethod.POST, consumes = { "multipart/form-data" })
	public String profileChange(MultipartHttpServletRequest request, RelationVO member, String studynum, String memberId,
			Model model) throws Throwable {
	
		autoComplete(model);
		MultipartFile multi = request.getFile("uploadfile");

		String filename = multi.getOriginalFilename();
		System.out.println("filename:[" + filename + "]");
		if (filename != null && !filename.equals("")) {
			String uploadPath = request.getRealPath("/") + "fileSave";
			System.out.println(uploadPath);

			String fileType = filename.substring(filename.lastIndexOf('.'), filename.length());
			String rename = member.getMemberId() + "profile_" + System.currentTimeMillis() + fileType;
			FileCopyUtils.copy(multi.getInputStream(), new FileOutputStream(uploadPath + "/" + rename));

			member.setPhoto(rename);
			
			model.addAttribute("filename", rename);
		} else {

			//member.setPhoto("");
		}

		
		relationDB.updateMemberInfo(member);
	
		
		System.out.println(member.getStudynum());
		return "redirect:/page/study_info?studynum="+member.getStudynum();
	}
	
	
	@RequestMapping("/leaveQuestion")
	public String leaveQuestion(HttpServletRequest req, HttpServletResponse res,Model mv) throws Throwable {
		autoComplete(mv);
		HeaderInfo(req, mv);
		String memberid=req.getParameter("name");
		String group=req.getParameter("group");
		
		StudyVO study=studyDB.getOneStudy(group);
		RelationVO memberInfo=relationDB.getMemberInfo(group, memberid);
		List memberlist=relationDB.getJoinMemberList(group);
		
		Iterator it=memberlist.iterator();
		
		while(it.hasNext()) {
			RelationVO tmp=(RelationVO)it.next();
			if(tmp.getMemberId()==memberid) {
				memberlist.remove(tmp);
			}
			
		}
		
		int membercount=memberlist.size();
		mv.addAttribute("membercount",membercount);
		mv.addAttribute("memberlist",memberlist);
		mv.addAttribute("memberInfo",memberInfo);
		
		return "study/leaveQuestion";
	}
	
	@RequestMapping("/leaveConfirm")
	public String leaveConfirm(HttpServletRequest req, HttpServletResponse res,Model mv, String studynum, String memberId) throws Throwable {
		autoComplete(mv);
		HeaderInfo(req, mv);
		
		StudyVO study=studyDB.getOneStudy(studynum);
		String leader=req.getParameter("leader");
		
		if(leader!=null) {
			relationDB.changeLeader(studynum, req.getParameter("leader"));
			study.setLeader(leader);
			
			
		}
	
		relationDB.leaveStudy(studynum, memberId);
		
		
		
		study.setPeopleCount(study.getPeopleCount()-1);
		studyDB.updateStudy(study);
		System.out.println("탈퇴시키기 성공");
		
		if(study.getPeopleCount()==0) {
			
			studyDB.deleteStudyByNum(studynum);
		}
			
		return "redirect:/page/main";
		
	}
   	//써야되는 메소드명 grantPosition changeLeader banishMember 
	//쓸수있는 매개변수 positionSelect studynum memberid leader
	
	@RequestMapping("/grantPosition")
	public String grantPosition(String memberid,String positionSelect,String studynum,
			String leader,Model mv) throws Throwable {
		studyDB.grantPostion(memberid,positionSelect,studynum);
		return "redirect:/page/study_admin";
	}
	@RequestMapping("/changeLeader")
	public String changeLeader(String memberid,String studynum) throws Throwable {
		relationDB.changeLeader(studynum, memberid);
		studyDB.changeLeader(studynum, memberid);
		return "../page/study_test";
	}
	@RequestMapping("/banishMember")
	public String banishMember(HttpServletRequest req, HttpServletResponse res,Model mv) throws Throwable {
		
		return "redirect:/page/study_admin";
	}
	@RequestMapping("/deleteStudyGroup")
	public String deleteStudyGroup(String studynum) throws Throwable {
		studyDB.deleteStudyByNum(studynum);
		return "page/main";
	}
}
