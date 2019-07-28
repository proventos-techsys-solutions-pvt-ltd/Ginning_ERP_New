package com.prov.weighing;

public class FetchWeight {
	
	public String fetch() {
		String weightStr ="";
		try
	    {
			weightStr = (new TwoWaySerialComm()).connect("COM3");
	    }
	    catch ( Exception e )
	    {
	        e.printStackTrace();
	    }
		return weightStr;
	}
	
	public double parseWeight(String weightStr) {
		double weight = 0 ;
		String[] strArr = weightStr.split("");
		String string = "";
		for (int i = 0; i < strArr.length; i++) {
			if(strArr[i].matches("\\d") || strArr[i].equals("."))
			{
				 string = string + strArr[i];
			}
		}
		try {
			weight = Double.parseDouble(string);
		}catch (NumberFormatException e1) {
			weightStr = fetch();
		}catch (NullPointerException e2) {
			weightStr = fetch();
		}
		return weight;
	}
}
