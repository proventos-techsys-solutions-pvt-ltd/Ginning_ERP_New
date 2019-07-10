package com.prov.tags;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.Map.Entry;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.prov.db.OracleConnection;

public class GradeRateTag extends SimpleTagSupport{
	
	public static TreeMap<String,String> getGrades() {			
		Connection con=null;
		ResultSet gradeResultSet = null;
		TreeMap<String,String> gradeName = new TreeMap<String,String>();
		try {
			 con = OracleConnection.getConnection();
			 
			 SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			 String date = simpleDateFormat.format(new Date());
			 Date date1 =  simpleDateFormat.parse(date);  
			 java.sql.Date voucherSqlDate = new java.sql.Date(date1.getDate());
			 
			 String accountQuery = "Select * from GRADE_RATE_MASTER WHERE RATE_DATE = "+ voucherSqlDate +" order by GRADE_ID";
			 Statement stmt = con.createStatement();
			 gradeResultSet = stmt.executeQuery(accountQuery);
			 while(gradeResultSet.next()) {
				 gradeName.put(gradeResultSet.getString("GRADE_ID"),gradeResultSet.getString("RATE"));
				}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return gradeName;
	}
	
	
	public void doTag() throws IOException {
		JspWriter out = getJspContext().getOut();
		Set<Entry<String,String>> gradeSet = getGrades().entrySet();
		Iterator<Entry<String,String>> compItr = gradeSet.iterator();
		while(compItr.hasNext()) {
			Map.Entry<String,String> gradeData = (Map.Entry<String,String>)compItr.next();
			String gradeDesc = (String)gradeData.getValue();
			String[] gradeArr =  gradeData.getKey().split("-");
			String gradeName = gradeArr[0];
			int gradeId = Integer.parseInt(gradeArr[1]);
			out.print("<option value='"+gradeName+"' data-gradeId='"+gradeId+"' data-description='"+gradeDesc+"'>"+gradeName+"</option>");
		}
	}

}
