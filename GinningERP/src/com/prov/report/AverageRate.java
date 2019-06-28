package com.prov.report;

import java.text.SimpleDateFormat;
import java.util.Date;

public class AverageRate {
	
	public double getAverageRate()
	{
		double averageRate=0;
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

		String date = simpleDateFormat.format(new Date());
		System.out.println(date);
		
		return averageRate;
	}

}
