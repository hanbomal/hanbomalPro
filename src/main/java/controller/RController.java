package controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Scanner;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
@RequestMapping("/R")
public class RController {
	private String path = "";
	String imgname = "";
	
	@RequestMapping("/rprocessing")
	public String rprocessing(HttpServletRequest request,
	          HttpServletResponse response)  throws Throwable { 
	     		
	    
	    String group=request.getParameter("group");
	     String date=request.getParameter("date");
	     String type=request.getParameter("type");
         
	        path=request.getRealPath("/");
	        path=path.replace("\\", "/"); //Project Path
	         
	         System.out.println(path);
	         String folderPath="c:/save/"+group;
	         String encoding="UTF-8";
	         
	         String filename=group+"_"+date+".txt";
	         
	           Map map=txtFile(folderPath+"/"+filename);
	           makecsv(map,filename);
	            
	        if(type.equals("wordcloud")) {
	               imgname=RserveService.getInstance()
	                     .wordcloudImport(group+"_wordcloud_"+date+".png",path+"RPro/templatecloud.R","c:/rsave"
	                           +"/"+filename+".csv",path);
	            }else if(type.equals("pie")) {
	               imgname=RserveService.getInstance().wordcloudImport(group+"_pie_"+date+".png",path+"RPro/templatePie.R","c:/rsave"
	                     +"/"+filename+".csv",path);
	            }
	        
	        
	            System.out.println(imgname);
	            request.setAttribute("imgname", imgname);
	         
	      
	     
	         return  "Rpage/image"; 
	         } 
	   
	   public void makecsv(Map map, String filename)throws IOException { 
	         System.out.println("csv:"+filename+".csv");
	         PrintStream ps=null;
	         FileOutputStream fos=null;
	         try {
	        	 File file=new File("c:/rsave");
	        	 if(!file.exists()) {
	        		 file.mkdirs();
	        	 }        			 
	    
	            fos=new FileOutputStream("c:/rsave/"+filename+".csv");
	            ps=new PrintStream(fos);
	            Iterator it=map.entrySet().iterator();
	            while(it.hasNext()) {
	               Entry et=(Entry)it.next();
	               ps.print(et.getKey()+","+et.getValue()+"\r\n");
	            }ps.flush();
	            ps.close();
	         }catch(FileNotFoundException e) {
	            e.printStackTrace();
	         }
	      } 
	   private Map txtFile(String realFileName) {
	      Map map=new HashMap();
	      try {
	         Scanner read=new Scanner(new FileReader(realFileName));
	         int i=0;
	         while(read.hasNext()) {
	            String content=read.nextLine();
	            System.out.println(content);
	            content=content.replace("<", "");
	            content=content.replace(">", "");
	            content=content.replace("(", " ");
	            content=content.replace(")", " ");
	            content=content.replace(";", "");
	            content=content.replace("[", "");
	            content=content.replace("]", "");
	            content=content.replace("\"", " ");
	            content=content.replace("/", " ");
	            content=content.replace("=", " ");
	            content=content.replace(",", " ");
	            content=content.replace(".", " ");
	            content=content.replace("-", "");
	            content=content.replace("\t", "");
	            content=content.replace("을", " ");
	            content=content.replace("까지", " ");
	            content=content.replace("가", " ");
	            content=content.replace("저는", " ");
	            String arg[]=content.split("\\s+");
	            
	            for(String str:arg) {
	               if(!str.equals("")) {
	                  if(map.containsKey(str))
	                     map.put(str, (Integer)map.get(str)+1);
	                  else
	                     map.put(str, 1);
	               }
	            }
	         }
	         read.close();
	         return map;
	      }catch(FileNotFoundException e) {
	         e.printStackTrace();
	         return null;
	      }
	   }

	
	
}
