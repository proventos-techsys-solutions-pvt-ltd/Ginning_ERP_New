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

public class CustomerTag extends SimpleTagSupport {
	
	public static TreeMap<Integer,String> getCompanies() {			
		Connection con=null;
		ResultSet customerResultSet = null;
		TreeMap<Integer,String> customerName = new TreeMap<Integer,String>();
		try {
			 con = OracleConnection.getConnection();
			 String companyQuery = "Select * from customer_mast order by name";
			 Statement stmt = con.createStatement();
			 customerResultSet = stmt.executeQuery(companyQuery);
			 while(customerResultSet.next()) {
				 customerName.put(customerResultSet.getInt("id"),customerResultSet.getString("name")+"-"+customerResultSet.getString("address")+"-"+customerResultSet.getString("mobile")+"-"+customerResultSet.getString("blacklisted")+"-"+customerResultSet.getString("membership"));
				}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return customerName;
	}
	
	
	public void doTag() throws IOException {
		JspWriter out = getJspContext().getOut();
		Set<Entry<Integer,String>> customerSet = getCompanies().entrySet();
		Iterator<Entry<Integer,String>> compItr =customerSet.iterator();
		while(compItr.hasNext()) {
			Map.Entry<Integer,String> customerData = (Map.Entry<Integer,String>)compItr.next();
			int customerKey = customerData.getKey();
			String customerValue = customerData.getValue();
			String[] customer = customerValue.split("-");
			String customerName = customer[0];
			String customerAddress = customer[1];
			String customerMobile = customer[2];
			String blacklisted = customer[3];
			String membership = customer[4];
			out.println("<option value='"+customerKey+"' data-mobile='"+customerMobile+"' data-address='"+customerAddress+"' data-blacklisted='"+blacklisted+"' data-membership='"+membership+"'>"+customerName+"</option>");
		}
	}

}
