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

public class GradeTag extends SimpleTagSupport {
	
	public static TreeMap<String,String> getGrades() {			
		Connection con=null;
		ResultSet gradeResultSet = null;
		TreeMap<String,String> gradeName = new TreeMap<String,String>();
		try {
			 con = OracleConnection.getConnection();
			 String accountQuery = "Select * from grade_master order by GRADE";
			 Statement stmt = con.createStatement();
			 gradeResultSet = stmt.executeQuery(accountQuery);
			 while(gradeResultSet.next()) {
				 gradeName.put(gradeResultSet.getString("GRADE"),gradeResultSet.getString("DECRIPTION"));
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
			String gradeName = (String)gradeData.getKey();
			out.print("<option value='"+gradeName+"' data-description='"+gradeDesc+"'>"+gradeName+"</option>");
		}
	}


}
