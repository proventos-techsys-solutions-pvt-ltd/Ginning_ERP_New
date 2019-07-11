package com.prov.tags;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
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
			 
			 String rateQuery = "SELECT * FROM GRADE_RATE_MASTER WHERE RATE_DATE = (SELECT MAX(RATE_DATE) FROM GRADE_RATE_MASTER)";
			 Statement stmt = con.createStatement();
			 gradeResultSet = stmt.executeQuery(rateQuery);
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
			String gradeId = gradeData.getKey();
			String gradeRate =  (String)gradeData.getValue();
			out.print("<option value='"+gradeRate+"' data-gradeId='"+gradeId+"'>"+gradeRate+"</option>");
		}
	}

}
