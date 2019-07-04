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

public class VehicleCategoryTag extends SimpleTagSupport  {
	
	public static TreeMap<Integer,String> getBanks() {			
		Connection con=null;
		ResultSet vehicleResultSet = null;
		TreeMap<Integer,String> vehicleCategory = new TreeMap<Integer,String>();
		try {
			 con = OracleConnection.getConnection();
			 String vehicleCategoryQuery = "Select * from weigh_rate_mast order by vehicle_name";
			 Statement stmt = con.createStatement();
			 vehicleResultSet = stmt.executeQuery(vehicleCategoryQuery);
			 while(vehicleResultSet.next()) {
				 vehicleCategory.put(vehicleResultSet.getInt("id"),vehicleResultSet.getString("vehicle_name"));
			 }
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return vehicleCategory;
	}
	
	public void doTag() throws IOException {
		JspWriter out = getJspContext().getOut();
		Set<Entry<Integer,String>> vehicleCategorySet = getBanks().entrySet();
		Iterator<Entry<Integer,String>> compItr =vehicleCategorySet.iterator();
		while(compItr.hasNext()) {
			Map.Entry<Integer,String> vehicleCategoryData = (Map.Entry<Integer,String>)compItr.next();
			String vehicleKey = (String)vehicleCategoryData.getValue();
			int vehicleValue = (int)vehicleCategoryData.getKey();
			out.println("<option value='"+vehicleValue+"'>"+vehicleKey+"</option>");
		}
	}

}
