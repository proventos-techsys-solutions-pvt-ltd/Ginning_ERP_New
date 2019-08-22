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

public class BankLedgerTag extends SimpleTagSupport {

	public static TreeMap<Integer,String> getAccountCats() {			
		Connection con=null;
		ResultSet accountCatResultSet = null;
		TreeMap<Integer,String> accountCategory = new TreeMap<Integer,String>();
		try {
			 con = OracleConnection.getConnection();
			 String accountQuery = "Select acc_ledger, account_id from general_ledger where acc_category_id=1 order by acc_ledger";
			 Statement stmt = con.createStatement();
			 accountCatResultSet = stmt.executeQuery(accountQuery);
			 while(accountCatResultSet.next()) {
				 accountCategory.put(accountCatResultSet.getInt("account_id"),accountCatResultSet.getString("acc_ledger"));
				}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return accountCategory;
	}
	
	
	public void doTag() throws IOException {
		JspWriter out = getJspContext().getOut();
		Set<Entry<Integer,String>> accountSet = getAccountCats().entrySet();
		Iterator<Entry<Integer,String>> compItr = accountSet.iterator();
		while(compItr.hasNext()) {
			Map.Entry<Integer,String> accountData = (Map.Entry<Integer,String>)compItr.next();
			String accountKey = (String)accountData.getValue();
			int accountValue = (int)accountData.getKey();
			out.println("<option value='"+accountValue+"'>"+accountKey+"</option>");
		}
	}
}
