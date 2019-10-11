package com.prov.weighing;

import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;

public class SerialReader 
{
    InputStream in;
    
    public SerialReader ( InputStream in )
    {
        this.in = in;
    }
    
    public String run ()
    {
    	    	
    	/******************************************
    	 * Original code
    	 ****************************************/
    	
        byte[] buffer = new byte[1024];
        int len = -1;
        //String weight = "";
        String[] arr = new String[6];
        try
        {
        	int i = 0;
            while ( ( len = this.in.read(buffer)) > -1 )
            {
            	String data = new String(buffer,0,len);
            	if(data.matches("\\d")) {
            		 //System.out.print(data);
            		 //weight = weight+data;
            		arr[i] = data;
            		 i++;
            		 if(i==6) {
            			 break;
            		 }
            	}
            }
        }
        catch ( IOException e )
        {
            e.printStackTrace();
        }  
        String str = Arrays.toString(arr);
        str = str.substring(1, str.length()-1).replace(", ", "");
        return str;
    }
}
