package com.prov.tags;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Iterator;
import java.util.Map;
import java.util.TreeMap;
import java.util.Map.Entry;
import java.util.Set;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.prov.db.OracleConnection;

public class CompanyTag extends SimpleTagSupport {
	
		
		public static TreeMap<Integer,String> getBanks() {			
			Connection con=null;
			ResultSet companyResultSet = null;
			TreeMap<Integer,String> companyName = new TreeMap<Integer,String>();
			try {
				 con = OracleConnection.getConnection();
				 String companyQuery = "Select * from company_master order by name";
				 Statement stmt = con.createStatement();
				 companyResultSet = stmt.executeQuery(companyQuery);
				 while(companyResultSet.next()) {
					  companyName.put(companyResultSet.getInt("id"),companyResultSet.getString("name"));
					}
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return companyName;
		}
		
		
		public void doTag() throws IOException {
			JspWriter out = getJspContext().getOut();
			Set<Entry<Integer,String>> companySet = getBanks().entrySet();
			Iterator<Entry<Integer,String>> compItr =companySet.iterator();
			while(compItr.hasNext()) {
				Map.Entry<Integer,String> companyData = (Map.Entry<Integer,String>)compItr.next();
				String companyKey = (String)companyData.getValue();
				int companyValue = (int)companyData.getKey();
				out.println("<option value='"+companyValue+"'>"+companyKey+"</option>");
				System.out.println(companyKey);
			}
		}
	}
