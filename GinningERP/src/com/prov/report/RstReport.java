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
			
			String sql = "SELECT GD.ID, GD.WEIGHMENT_ID, GD.MATERIAL, GD.QUANTITY, GD.GRADE, GD.RATE, GD.AUTHORIZED_BY, GD.MOISTURE, GD.BONUS_PER_QTL, WM.VID, WM.RST, WM.NET, CVM.CID, CVM.WEIGH_RATE, CM.NAME, CM.ADDRESS, CM.MOBILE, CM.BLACKLISTED, CM.MEMBERSHIP, GM.DESCRIPTION GRADE_DESC\r\n" + 
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
				jsonObj.put("bonusPerQtl", rs.getString(9));
				jsonObj.put("vehicleId", rs.getString(10));
				jsonObj.put("rst", rs.getString(11));
				jsonObj.put("netQuantity", rs.getString(12));
				jsonObj.put("customerId", rs.getString(13));
				jsonObj.put("weighRate", rs.getString(14));
				jsonObj.put("customerName", rs.getString(15));
				jsonObj.put("customerAddress", rs.getString(16));
				jsonObj.put("customerMobile", rs.getString(17));
				jsonObj.put("customerBlacklisted", rs.getInt(18));
				jsonObj.put("customerMembership", rs.getInt(19));
				jsonObj.put("gradeDesc", rs.getString(20));
				
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
					"										CM.ID = CVM.CID AND\r\n" + 
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
	
	public JSONObject getRSTForPrint(int weighmentId) {
		
		ResultSet rs = null;
		Connection con = null;
		JSONObject jsonObj = new JSONObject();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT \r\n" + 
						"WM.RST, \r\n" + 
						"WM.MATERIAL, \r\n" + 
						"WM.GROSS, \r\n" + 
						"WM.GROSSWT_TIME, \r\n" + 
						"WM.TARE, \r\n" + 
						"WM.NET, \r\n" + 
						"WM.TAREWT_TIME, \r\n" + 
						"WM.WEIGHMENT_DATE, \r\n" + 
						"CVM.VEHICLE_NO, \r\n" + 
						"CVM.WEIGH_RATE, \r\n" + 
						"WRM.VEHICLE_NAME, \r\n" + 
						"CUST.NAME, \r\n" + 
						"CUST.ADDRESS, \r\n" + 
						"CUST.MOBILE,\r\n" + 
						"COMP.NAME COMP_NAME, \r\n" + 
						"COMP.ADDRESS COMP_NAME, \r\n" + 
						"COMP.MOBILE COMP_MOBILE \r\n" + 
						"FROM WEIGH_MAST WM, CUSTOMER_VEHICLE_MAST CVM, WEIGH_RATE_MAST WRM, CUSTOMER_MAST CUST, COMPANY_MASTER COMP \r\n" + 
						"WHERE  \r\n" + 
						"WM.VID = CVM.ID AND \r\n" + 
						"CVM.CID = CUST.ID AND \r\n" + 
						"CVM.V_TYPE_ID = WRM.ID AND \r\n" + 
						"COMP.ID = (SELECT COMPANY_ID FROM DAILY_SETUP WHERE SETUP_DATE = (SELECT MAX(SETUP_DATE) FROM DAILY_SETUP)) AND \r\n" + 
						"WM.ID="+weighmentId;
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				
				jsonObj.put("RSTNO", rs.getInt(1));
				jsonObj.put("material", rs.getString(2));
				jsonObj.put("grossWt", rs.getDouble(3));
				jsonObj.put("grossTime", rs.getString(4));
				jsonObj.put("tare", rs.getDouble(5));
				jsonObj.put("net", rs.getDouble(6));
				jsonObj.put("tareTime", rs.getString(7));
				jsonObj.put("dateAndTime", rs.getString(8));
				jsonObj.put("vehicleNo", rs.getString(9));
				jsonObj.put("charges", rs.getFloat(10));
				jsonObj.put("vehicleType", rs.getString(11));
				jsonObj.put("customerName", rs.getString(12));
				jsonObj.put("customerAddress", rs.getString(13));
				jsonObj.put("customerMobileNo", rs.getString(14));
				jsonObj.put("companyName", rs.getString(15));
				jsonObj.put("companyAddress", rs.getString(16));
				jsonObj.put("companyMobileNo", rs.getString(17));
				
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
