package com.prov.weighing;

public class FetchWeight {
	
	public double fetch() {
	
		double weight = 0 ;
		String weightStr ="";
		try
	    {
			weightStr = (new TwoWaySerialComm()).connect("COM3");
	    }
	    catch ( Exception e )
	    {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }
		
		String[] strArr = weightStr.split("");
		String string = "";
		for (int i = 0; i < strArr.length; i++) {
			if(strArr[i].matches("\\d"))
			{
				 string = string + strArr[i];
			}
		}
		try {
			weight = Double.parseDouble(string);
		}catch (Exception e) {
			weight = fetch();
		}
		return weight;
	}
}
