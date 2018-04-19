package controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

public class RserveService {
	private static RserveService instance = new RserveService();

	public static RserveService getInstance() {
		return instance;
	}

	public static void main(String[] args) {

	}

	 
	public String wordcloudImport(String imgname, String scriptfile, String csvfile, String path) {
		RConnection c;
		System.out.println(scriptfile);
		try {
			c=new RConnection();
			BufferedReader in=new BufferedReader(new FileReader(scriptfile));
			String s;
			System.out.println("***"+csvfile);
			System.out.println(path);
			while((s=in.readLine())!=null) {
				s=s.replace("[img]", path+"Rimg/"+imgname);
				s=s.replace("[filename]", csvfile);
				System.out.println(s);
				c.parseAndEval(s);
			}
			System.out.println("close");
			c.close();
			in.close();
		}catch(IOException e) {
			e.printStackTrace();
		}finally {
			return imgname;
		}
	
	}
	
	

	    public REXP x = null;
	    public RConnection c = null;
	    public String retStr = "";

	    public String returnRClass() throws RserveException, REXPMismatchException{

	            c = new RConnection();
	            x = c.eval("1+2");
	            retStr = x.asString();

	        return retStr;
	    }
	
	
}
