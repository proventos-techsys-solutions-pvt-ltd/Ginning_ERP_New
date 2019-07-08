package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.json.JSONArray;
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
	
	
	public JSONArray getDataForInvoicing(int rst){
		
		ResultSet rs = null;
		Connection con = null;
		JSONArray jsonArray = new JSONArray();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT GD.ID, GD.WEIGHMENT_ID, GD.MATERIAL, GD.QUANTITY, GD.GRADE, GD.RATE, GD.AUTHORIZED_BY, GD.MOISTURE, WM.VID, WM.RST, CVM.CID, CM.NAME, CM.ADDRESS, CM.MOBILE\r\n" + 
					"FROM GRADE_DETAILS GD, WEIGH_MAST WM, CUSTOMER_VEHICLE_MAST CVM, CUSTOMER_MAST CM \r\n" + 
					"WHERE\r\n" + 
					"GD.WEIGHMENT_ID = WM.ID AND\r\n" + 
					"WM.VID = CVM.ID AND\r\n" + 
					"CVM.CID = CM.ID AND\r\n" + 
					"GD.RST="+rst;
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				
				JSONObject jsonObj = new JSONObject();
				
				jsonObj.put("gradeId", rs.getString(1));
				jsonObj.put("weighmentId", rs.getString(2));
				jsonObj.put("material", rs.getString(3));
				jsonObj.put("quantity", rs.getString(4));
				jsonObj.put("grade", rs.getString(5));
				jsonObj.put("rate", rs.getString(6));
				jsonObj.put("authorizer", rs.getString(7));
				jsonObj.put("moisture", rs.getString(8));
				jsonObj.put("vehicleId", rs.getString(9));
				jsonObj.put("rst", rs.getString(10));
				jsonObj.put("customerId", rs.getString(11));
				jsonObj.put("customerName", rs.getString(12));
				jsonObj.put("customerAddress", rs.getString(13));
				jsonObj.put("customerMobile", rs.getString(14));
				
				jsonArray.put(jsonObj);
			}
			
			rs.close();
			stmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return jsonArray;
		
	}

}
