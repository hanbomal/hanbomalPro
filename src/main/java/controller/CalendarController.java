package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.CalendarDAO;
import model.CalendarVO;

@Controller
@RequestMapping("/calcontroller")
public class CalendarController {



	@RequestMapping("/listview")
	public String listview(HttpServletRequest req, HttpServletResponse res, String num) throws Throwable {

		CalendarDAO cpro = CalendarDAO.getInstance();

		List li = null;

		li = cpro.getCalendarList(Integer.parseInt(num)); // 임의로 1로 해놓음

		//System.out.println(li);

		req.setAttribute("list", li);
		req.setAttribute("num", num);

		return "calendar/study_calendar2";
	}

	@RequestMapping("/addPro1")
	public String addPro1(HttpServletRequest req, HttpServletResponse res, String num) throws Throwable {
		CalendarDAO cpro=CalendarDAO.getInstance();
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

		CalendarDAO cpro=CalendarDAO.getInstance();
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
  	  CalendarDAO cpro=CalendarDAO.getInstance();
  	  CalendarVO calendar=cpro.getCalendar(id);
  	  req.setAttribute("calendar",calendar); 
  	

		return "calendar/contentsView";

	}

	@RequestMapping("/updateForm")
	public String updateForm(HttpServletRequest req, HttpServletResponse res) throws Throwable {

		
		  String id = req.getParameter("id");
		  String num=req.getParameter("num");
		  CalendarDAO cpro=CalendarDAO.getInstance();
		  CalendarVO calendar=cpro.getCalendar(id);
		  req.setAttribute("calendar",calendar); 
		  req.setAttribute("group", num);
		
		return "calendar/updateSchedule";

	}

	@RequestMapping("/updatePro")
	public String updatePro(HttpServletRequest req, HttpServletResponse res) throws Throwable {


		  CalendarDAO cpro=CalendarDAO.getInstance();
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

	
}
