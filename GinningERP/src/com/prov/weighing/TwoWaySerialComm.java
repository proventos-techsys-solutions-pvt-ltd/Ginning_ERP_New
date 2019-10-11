package com.prov.weighing;

import java.io.InputStream;
import gnu.io.CommPortIdentifier;
import gnu.io.SerialPort;

public class TwoWaySerialComm
{
    public TwoWaySerialComm()
    {
        super();
    }
    
    String connect ( String portName ) throws Exception
    {
    	String weight="";
    	try {
	    	CommPortIdentifier portIdentifier = CommPortIdentifier.getPortIdentifier(portName);
	    	
	        if ( portIdentifier.isCurrentlyOwned() )
	        {
	            System.out.println("Error: Port is currently in use");
	        }
	        else
	        {
	            gnu.io.CommPort commPort = portIdentifier.open(this.getClass().getName(),2000);
	            
	            if ( commPort instanceof SerialPort )
	            {
	                SerialPort serialPort = (SerialPort) commPort;
	                serialPort.setSerialPortParams(2400,SerialPort.DATABITS_8,SerialPort.STOPBITS_1,SerialPort.PARITY_NONE);
	                
	                InputStream in = serialPort.getInputStream();
	                //OutputStream out = serialPort.getOutputStream();
	                
	                //(new Thread(new SerialReader(in))).start();
	                //(new Thread(new SerialWriter(out))).start();
	                
	                weight = ((new SerialReader(in)).run());
	                System.out.println(weight);
	            }
	            else
	            {
	                System.out.println("Error: Only serial ports are handled by this example.");
	            }
	            commPort.close();
	        } 
    	}catch(Exception e){
    		e.printStackTrace();
    		return weight;
    	}
        return weight;
    }
}