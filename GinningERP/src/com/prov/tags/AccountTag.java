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

public class AccountTag extends SimpleTagSupport{
	
	public static TreeMap<Integer,String> getBanks() {			
		Connection con=null;
		ResultSet accountResultSet = null;
		TreeMap<Integer,String> accountName = new TreeMap<Integer,String>();
		try {
			 con = OracleConnection.getConnection();
			 String accountQuery = "Select * from account_name_master order by account_name";
			 Statement stmt = con.createStatement();
			 accountResultSet = stmt.executeQuery(accountQuery);
			 while(accountResultSet.next()) {
				  accountName.put(accountResultSet.getInt("id"),accountResultSet.getString("account_name"));
				}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return accountName;
	}
	
	
	public void doTag() throws IOException {
		JspWriter out = getJspContext().getOut();
		Set<Entry<Integer,String>> accountSet = getBanks().entrySet();
		Iterator<Entry<Integer,String>> compItr = accountSet.iterator();
		while(compItr.hasNext()) {
			Map.Entry<Integer,String> accountData = (Map.Entry<Integer,String>)compItr.next();
			String accountKey = (String)accountData.getValue();
			int accountValue = (int)accountData.getKey();
			out.println("<option value='"+accountValue+"'>"+accountKey+"</option>");
		}
	}

}
