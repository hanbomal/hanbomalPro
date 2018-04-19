package chat;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;
public class test {

	
	static public void main(String args[]) throws RserveException, REXPMismatchException {

	    RConnection c = new RConnection();
	    REXP x = c.eval("1+2");
	    System.out.print(x.asString());

	}




}
