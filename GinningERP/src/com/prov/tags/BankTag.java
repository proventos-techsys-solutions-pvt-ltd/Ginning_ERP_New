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
				 String bankQuery = "Select * from Bank_mast order by bank_name";
				 Statement stmt = con.createStatement();
				 bankResultSet = stmt.executeQuery(bankQuery);
				 while(bankResultSet.next()) {
					  JSONObject obj = new JSONObject();
					  obj.put("bankName", bankResultSet.getString("bank_name"));
					  obj.put("bankId",bankResultSet.getString("id"));
					  obj.put("companyId", bankResultSet.getString("company_id"));
					  obj.put("accountNo", bankResultSet.getString("account_no"));
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
					out.println("<option class='bankOptions' data-company-id='"+jsonArray.getJSONObject(i).get("companyId")+"' value='"+jsonArray.getJSONObject(i).get("bankId")+"'>"+jsonArray.getJSONObject(i).get("bankName")+" - "+jsonArray.getJSONObject(i).get("accountNo")+"</option>");
				} catch (JSONException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
