package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.json.JSONObject;

import com.prov.db.OracleConnection;

public class RstReport {
	
	public JSONObject getWeighmentData(int rst) {
		
		ResultSet rs = null;
		Connection con = null;
		JSONObject jsonObj = new JSONObject();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT \r\n" + 
					"					    CM.NAME, \r\n" + 
					"					    CM.ADDRESS,\r\n" + 
					"					   CM.MOBILE, \r\n" + 
					"					    WM.ID, \r\n" + 
					"					    WM.MATERIAL, \r\n" + 
					"					    WM.NET\r\n" + 
					"					FROM \r\n" + 
					"					    customer_mast CM, \r\n" + 
					"					    customer_vehicle_mast CVM, \r\n" + 
					"					    WEIGH_MAST WM\r\n" + 
					"					WHERE \r\n" + 
					"					WM.VID = CVM.ID AND\r\n" + 
					"					CVM.CID = CM.ID AND \r\n" + 
					"					WM.RST="+rst;
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				
				jsonObj.put("vendorName", rs.getString(1));
				jsonObj.put("vendorAddress", rs.getString(2));
				jsonObj.put("vendorMobile", rs.getString(3));
				jsonObj.put("weighmentId", rs.getString(4));
				jsonObj.put("material", rs.getString(5));
				jsonObj.put("netWeight", rs.getString(6));
				
			}
			
			rs.close();
			stmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return jsonObj;
		
	}

}
