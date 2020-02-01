package com.prov.tags;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.prov.db.OracleConnection;

public class AccountLedgerTag extends SimpleTagSupport{

	public static JSONArray getAccountCats() {			
		Connection con=null;
		ResultSet accountCatResultSet = null;
		JSONArray jsonArray = new JSONArray();
		try {
			 con = OracleConnection.getConnection();
			 String accountQuery = "SELECT\r\n" + 
						 		"    UNIQUE ACC_LEDGER,\r\n" + 
						 		"    ACCOUNT_ID,\r\n" + 
						 		"    COMPANY_ID\r\n" + 
						 		"FROM\r\n" + 
						 		"    ACCOUNT_NAME\r\n" + 
						 		"ORDER BY\r\n" + 
						 		"    ACC_LEDGER";
			 Statement stmt = con.createStatement();
			 accountCatResultSet = stmt.executeQuery(accountQuery);
			 while(accountCatResultSet.next()) {
				 JSONObject obj = new JSONObject();
				  obj.put("accLedger", accountCatResultSet.getString("acc_ledger"));
				  obj.put("accId",accountCatResultSet.getString("account_id"));
				  obj.put("companyId", accountCatResultSet.getString("company_id"));
				  jsonArray.put(obj);
				}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return jsonArray;
	}
	
	
	public void doTag() throws IOException {
		JspWriter out = getJspContext().getOut();
		JSONArray jsonArray = getAccountCats();
		for(int i=0;i<jsonArray.length();i++) {
			try {
				out.println("<option data-company-id='"+jsonArray.getJSONObject(i).get("companyId")+"' value='"+jsonArray.getJSONObject(i).get("accId")+"'>"+jsonArray.getJSONObject(i).get("accLedger")+"</option>");
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
