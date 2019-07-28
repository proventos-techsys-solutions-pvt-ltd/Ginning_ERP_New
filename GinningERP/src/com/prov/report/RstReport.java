package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

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
					"					    CM.MOBILE, \r\n" + 
					"					    CM.BLACKLISTED, \r\n" + 
					"					    CM.MEMBERSHIP, \r\n" + 
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
				jsonObj.put("vendorBlacklisted", rs.getInt(4));
				jsonObj.put("vendorMembership", rs.getInt(5));
				jsonObj.put("weighmentId", rs.getString(6));
				jsonObj.put("material", rs.getString(7));
				jsonObj.put("netWeight", rs.getString(8));
				
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
			
			String sql = "SELECT GD.ID, GD.WEIGHMENT_ID, GD.MATERIAL, GD.QUANTITY, GD.GRADE, GD.RATE, GD.AUTHORIZED_BY, GD.MOISTURE, WM.VID, WM.RST, WM.NET, CVM.CID, CVM.WEIGH_RATE, CM.NAME, CM.ADDRESS, CM.MOBILE, CM.BLACKLISTED, CM.MEMBERSHIP, GM.DESCRIPTION GRADE_DESC\r\n" + 
					"					FROM GRADE_DETAILS GD, WEIGH_MAST WM, CUSTOMER_VEHICLE_MAST CVM, CUSTOMER_MAST CM, GRADE_MASTER GM\r\n" + 
					"					WHERE\r\n" + 
					"                    GD.GRADE = GM.GRADE AND\r\n" + 
					"					GD.WEIGHMENT_ID = WM.ID AND\r\n" + 
					"					WM.VID = CVM.ID AND \r\n" + 
					"					CVM.CID = CM.ID AND\r\n" + 
					"					GD.RST="+rst;
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				
				JSONObject jsonObj = new JSONObject();
				
				jsonObj.put("gradeId", rs.getString(1));
				jsonObj.put("weighmentId", rs.getString(2));
				jsonObj.put("material", rs.getString(3));
				jsonObj.put("quantity", rs.getString(4));
				jsonObj.put("grade", rs.getString(5));
				jsonObj.put("rate", rs.getFloat(6));
				jsonObj.put("authorizer", rs.getString(7));
				jsonObj.put("moisture", rs.getString(8));
				jsonObj.put("vehicleId", rs.getString(9));
				jsonObj.put("rst", rs.getString(10));
				jsonObj.put("netQuantity", rs.getString(11));
				jsonObj.put("customerId", rs.getString(12));
				jsonObj.put("weighRate", rs.getString(13));
				jsonObj.put("customerName", rs.getString(14));
				jsonObj.put("customerAddress", rs.getString(15));
				jsonObj.put("customerMobile", rs.getString(16));
				jsonObj.put("customerBlacklisted", rs.getInt(17));
				jsonObj.put("customerMembership", rs.getInt(18));
				jsonObj.put("gradeDesc", rs.getString(19));
				
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
	
	public JSONObject getRstForSecondWeighment(int rst) {
		
		ResultSet rs = null;
		Connection con = null;
		JSONObject jsonObj = new JSONObject();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT \r\n" + 
					"										    CM.NAME, \r\n" + 
					"										    CM.ADDRESS,\r\n" + 
					"										    CM.MOBILE, \r\n" + 
					"										    CM.BLACKLISTED, \r\n" + 
					"										    CM.MEMBERSHIP, \r\n" + 
					"										    CVM.VEHICLE_NO, \r\n" + 
					"										    CVM.WEIGH_RATE, \r\n" + 
					"										    WRM.VEHICLE_NAME, \r\n" + 
					"										    WM.ID, \r\n" + 
					"										    WM.MATERIAL, \r\n" + 
					"										    WM.gross,\r\n" + 
					"                                            wm.grosswt_time,\r\n" + 
					"                                            wm.tare,\r\n" + 
					"                                            wm.tarewt_time,\r\n" + 
					"                                            wm.net,\r\n" + 
					"											 wm.weighment_date\r\n" +
					"										FROM \r\n" + 
					"										    customer_mast CM, \r\n" + 
					"										    customer_vehicle_mast CVM, \r\n" + 
					"										    WEIGH_MAST WM,\r\n" + 
					"										    WEIGH_RATE_MAST WRM\r\n" + 
					"										WHERE \r\n" + 
					"										WM.VID = CVM.ID AND\r\n" + 
					"										CM.ID = CVM.ID AND\r\n" + 
					"										CVM.V_TYPE_ID = WRM.ID AND \r\n" + 
					"										WM.RST="+rst;
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				
				jsonObj.put("vendorName", rs.getString(1));
				jsonObj.put("vendorAddress", rs.getString(2));
				jsonObj.put("vendorMobile", rs.getString(3));
				jsonObj.put("vendorBlacklisted", rs.getInt(4));
				jsonObj.put("vendorMembership", rs.getInt(5));
				jsonObj.put("vehicleNo", rs.getString(6));
				jsonObj.put("weighRate", rs.getString(7));
				jsonObj.put("vehicleName", rs.getString(8));
				jsonObj.put("weighmentId", rs.getString(9));
				jsonObj.put("material", rs.getString(10));
				jsonObj.put("grossWt", rs.getString(11));
				jsonObj.put("grossWtTime", rs.getString(12));
				jsonObj.put("tareWt", rs.getString(13));
				jsonObj.put("tareWtTime", rs.getString(14));
				jsonObj.put("netWt", rs.getString(15));
				jsonObj.put("netWtTime", rs.getString(14));
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date date = sdf.parse(rs.getString(16));
				String dateStr = sdf.format(date);
				
				jsonObj.put("weighmentDate", dateStr);
				
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
