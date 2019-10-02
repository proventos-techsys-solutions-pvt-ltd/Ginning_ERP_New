package com.prov.weighing;

import java.io.IOException;
import java.io.InputStream;

public class SerialReaderRunnable implements Runnable {
	
	 InputStream in;
	 
	 //Initially setting the flag as true
	 private volatile boolean flag = true;
	     
    //This method will set flag as false
    public void stopRunning()
    {
        flag = false;
    }
 
     public SerialReaderRunnable ( InputStream in )
     {
         this.in = in;
     }
     
     public void run ()
     {
    	 while(flag) {
	         byte[] buffer = new byte[1024];
	         int len = -1;
	         try
	         {
	             while ( ( len = this.in.read(buffer)) > -1 )
	             {
	                 System.out.print(new String(buffer,0,len));
	             }
	         }
	         catch ( IOException e )
	         {
	             e.printStackTrace();
	         }
    	 }
     }
}
