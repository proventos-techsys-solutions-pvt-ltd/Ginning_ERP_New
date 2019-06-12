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

public class BankTag extends SimpleTagSupport {
	
		
		public static TreeMap<String,Integer> getBanks() {			
			Connection con=null;
			ResultSet bankResultSet = null;
			TreeMap<String,Integer> bankName = new TreeMap<String,Integer>();
			try {
				 con = OracleConnection.getConnection();
				 String bankQuery = "Select * from Bank_mast order by name";
				 Statement stmt = con.createStatement();
				 bankResultSet = stmt.executeQuery(bankQuery);
				 while(bankResultSet.next()) {
					  bankName.put(bankResultSet.getString("bank_name"),bankResultSet.getInt("id"));
					}
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return bankName;
		}
		
		
		public void doTag() throws IOException {
			JspWriter out = getJspContext().getOut();
			Set<Entry<String, Integer>> bankSet = getBanks().entrySet();
			Iterator<Entry<String, Integer>> bankItr =bankSet.iterator();
			while(bankItr.hasNext()) {
				Map.Entry<String, Integer> bankData = (Map.Entry<String, Integer>)bankItr.next();
				String bankKey = (String)bankData.getKey();
				int bankValue = (int)bankData.getValue();
				out.println("<option value='"+bankValue+"'>"+bankKey+"</option>");
			}
		}
	}
