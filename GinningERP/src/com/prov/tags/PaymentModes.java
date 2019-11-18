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

public class PaymentModes extends SimpleTagSupport{

	public static TreeMap<String,Integer> getModes() {			
		Connection con=null;
		ResultSet paymentSet = null;
		TreeMap<String,Integer> paymenModes = new TreeMap<String,Integer>();
		try {
			 con = OracleConnection.getConnection();
			 String accountQuery = "Select * from payment_modes";
			 Statement stmt = con.createStatement();
			 paymentSet = stmt.executeQuery(accountQuery);
			 while(paymentSet.next()) {
				 paymenModes.put(paymentSet.getString("PAY_MODE"),paymentSet.getInt("ID"));
				}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return paymenModes;
	}
	
	
	public void doTag() throws IOException {
		JspWriter out = getJspContext().getOut();
		Set<Entry<String,Integer>> gradeSet = getModes().entrySet();
		Iterator<Entry<String,Integer>> compItr = gradeSet.iterator();
		while(compItr.hasNext()) {
			Map.Entry<String,Integer> paymentMode = (Map.Entry<String,Integer>)compItr.next();
			String mode = (String)paymentMode.getKey();
			int id =  paymentMode.getValue();
			out.print("<option value='"+id+"'>"+mode+"</option>");
		}
	}

	
}
