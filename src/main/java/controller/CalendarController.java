package controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.CalendarDAO;
import model.BoardTypeVO;
import model.BoardVO;
import model.CalendarVO;

@Controller
@RequestMapping("/calcontroller")
public class CalendarController {

	CalendarDAO cpro = CalendarDAO.getInstance();

	@RequestMapping("/listview")
	public String listview(HttpServletRequest req, HttpServletResponse res, String num) throws Throwable {

		

		List li = null;

		li = cpro.getCalendarList(Integer.parseInt(num)); // 임의로 1로 해놓음

		//System.out.println(li);

		req.setAttribute("list", li);
		req.setAttribute("num", num);

		return "calendar/study_calendar2";
	}

	@RequestMapping("/addPro1")
	public String addPro1(HttpServletRequest req, HttpServletResponse res, String num) throws Throwable {
		
    	CalendarVO calendar=new CalendarVO();
    	
    	calendar.setTitle(req.getParameter("title"));
    	if(req.getParameter("description")!=null) {
    	calendar.setDescription(req.getParameter("description"));
    	}else {
    		calendar.setDescription("");
    	}
    	if(req.getParameter("place")!=null) {
    		calendar.setPlace(req.getParameter("place"));
        	}else {
        		calendar.setPlace("");
        	}
        	
    	calendar.setStartdate(req.getParameter("startdate"));
    	calendar.setEnddate(req.getParameter("enddate"));
    	calendar.setStudynum(Integer.parseInt(num));	
    	
    	cpro.addCalendar(calendar);
    	System.out.println(calendar);
    	
    	req.setAttribute("group", num);
    	
    	
    	//System.out.println(num+"=============testtesttest");

		return "calendar/addComp";
	}

	@RequestMapping("/deleteCalendar")
	public String deleteCalendar(HttpServletRequest req, HttpServletResponse res) throws Throwable {

		
    	String snum=req.getParameter("id");
    	String num=req.getParameter("num");
    	
    	cpro.deleteCalendar(snum);
    	
        System.out.println("스케쥴 삭제");
       
        req.setAttribute("group", num);
        
		return "calendar/deleteComp";
	}

	@RequestMapping("/contents")
	public String contents(HttpServletRequest req, HttpServletResponse res) throws Throwable {


  	  String id = req.getParameter("id");
  	
  	  CalendarVO calendar=cpro.getCalendar(id);
  	  req.setAttribute("calendar",calendar); 
  	

		return "calendar/contentsView";

	}
	
	@RequestMapping("/contentsReview")
	public String contentsReview(HttpServletRequest req, HttpServletResponse res) throws Throwable {


  	  String id = req.getParameter("id");
  	
  	  CalendarVO calendar=cpro.getCalendar(id);
  	  
  	  if(calendar==null) {
  		 calendar=new CalendarVO();
  		  calendar.setDescription("삭제된 일정입니다.");
  		  calendar.setTitle("삭제된 일정입니다.");
  		  
  	  }
  	  
  	  req.setAttribute("calendar",calendar); 
  	

		return "calendar/contentsReview";

	}
	

	@RequestMapping("/updateForm")
	public String updateForm(HttpServletRequest req, HttpServletResponse res) throws Throwable {

		
		  String id = req.getParameter("id");
		  String num=req.getParameter("num");
		 
		  CalendarVO calendar=cpro.getCalendar(id);
		  req.setAttribute("calendar",calendar); 
		  req.setAttribute("group", num);
		
		return "calendar/updateSchedule";

	}

	@RequestMapping("/updatePro")
	public String updatePro(HttpServletRequest req, HttpServletResponse res) throws Throwable {


		 
		  CalendarVO calendar=new CalendarVO();
		  
		  calendar.setDescription(req.getParameter("description"));
		  calendar.setEnddate(req.getParameter("enddate"));
		  calendar.setStartdate(req.getParameter("startdate"));
		  calendar.setNum(Integer.parseInt(req.getParameter("id")));
		  calendar.setPlace(req.getParameter("place"));
		  calendar.setStudynum(Integer.parseInt(req.getParameter("studynum")));
		  calendar.setTitle(req.getParameter("title"));
		  
		cpro.updateCalendar(calendar);
		
		req.setAttribute("group", req.getParameter("studynum"));
	  
		return "calendar/updateComp";

	}
	

	@RequestMapping("/dailyWordsView")
	public String dailyWordsView(HttpServletRequest req, HttpServletResponse res, Model model) throws Throwable {
		String day=req.getParameter("day");
		String num=req.getParameter("num");
		String fileName=day.replaceAll("-", "");
		
		model.addAttribute("day",day);
		model.addAttribute("num",num);
		model.addAttribute("fileName",fileName);
		
		
		try {
		File file=new File("c:\\save\\"+num+"\\"+num+"_"+fileName+".txt");
		if(!file.exists()) {
			model.addAttribute("isExists","FALSE");
		}else {
			model.addAttribute("isExists","TRUE");
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
	  
		return "calendar/dailyWordsView";

	}
	
	@ResponseBody
	@RequestMapping(value = "loadSchedule", method = RequestMethod.GET, produces="application/json")
	public Map< String, Object> ajax_receiveJSON(HttpServletRequest req) {
	   
	 
	   String id=req.getParameter("id");
		String group=req.getParameter("group");
		
		
		CalendarVO schedule=cpro.getCalendar(id);
		
	
	  Map< String, Object> map = new HashMap< String, Object>();
	    
	 
	  map.put("title", schedule.getTitle());
	  map.put("sdate", schedule.getStartdate());
	  map.put("edate", schedule.getEnddate());
	  
	 
	   
	 return map;    
	} 

	
}
