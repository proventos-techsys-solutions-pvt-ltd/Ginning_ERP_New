package com.prov.weighing;

import java.io.IOException;
import java.io.InputStream;

public class SerialReader
{
    InputStream in;
    
    public SerialReader ( InputStream in )
    {
        this.in = in;
    }
    
    public String run ()
    {
        byte[] buffer = new byte[1024];
        int len = -1;
        String weight = "";
        try
        {
        	int i=0;
            while ( ( len = this.in.read(buffer)) > -1 )
            {
            	i++;
               weight = weight + new String(buffer,0,len);
                if(i==12) {
                	break;
                }
            }
        }
        catch ( IOException e )
        {
            e.printStackTrace();
        }    
        return weight;
    }
}
