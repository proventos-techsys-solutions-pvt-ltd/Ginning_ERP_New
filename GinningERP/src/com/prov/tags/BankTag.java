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

public class BankTag extends SimpleTagSupport {
	
		public static JSONArray getBanks() {			
			Connection con=null;
			ResultSet bankResultSet = null;
			JSONArray jsonArray = new JSONArray();
			try {
				 con = OracleConnection.getConnection();
				 String bankQuery = "SELECT\r\n" + 
						 		"    BM.ID,\r\n" + 
						 		"    BM.COMPANY_ID,\r\n" + 
						 		"    BM.BANK_NAME,\r\n" + 
						 		"    BM.ACCOUNT_NO,\r\n" + 
						 		"    AN.ACCOUNT_ID\r\n" + 
						 		"FROM\r\n" + 
						 		"    BANK_MAST      BM,\r\n" + 
						 		"    ACCOUNT_NAME   AN\r\n" + 
						 		"WHERE\r\n" + 
						 		"    AN.BANK_ID = BM.ID\r\n" + 
						 		"ORDER BY\r\n" + 
						 		"    BANK_NAME";
				 Statement stmt = con.createStatement();
				 bankResultSet = stmt.executeQuery(bankQuery);
				 while(bankResultSet.next()) {
					  JSONObject obj = new JSONObject();
					  obj.put("bankName", bankResultSet.getString("bank_name"));
					  obj.put("bankId",bankResultSet.getString("id"));
					  obj.put("companyId", bankResultSet.getString("company_id"));
					  obj.put("accountNo", bankResultSet.getString("account_no"));
					  obj.put("accountId", bankResultSet.getString("account_id"));
					  jsonArray.put(obj);
					}
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return jsonArray;
		}
		
		
		public void doTag() throws IOException {
			JspWriter out = getJspContext().getOut();
			JSONArray jsonArray = getBanks();
			for(int i=0;i<jsonArray.length();i++) {
				try {
					out.println("<option class='bankOptions' data-company-id='"+jsonArray.getJSONObject(i).get("companyId")+"' value='"+jsonArray.getJSONObject(i).get("bankId")+"' data-account-id='"+jsonArray.getJSONObject(i).get("accountId")+"'>"+jsonArray.getJSONObject(i).get("bankName")+" - "+jsonArray.getJSONObject(i).get("accountNo")+"</option>");
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
