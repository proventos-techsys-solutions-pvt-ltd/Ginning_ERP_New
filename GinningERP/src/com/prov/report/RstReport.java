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
			
			String sql = "SELECT \r\n" + 
					"GD.ID, GD.WEIGHMENT_ID, GD.MATERIAL, GD.QUANTITY, GD.GRADE, GD.RATE, GD.AUTHORIZED_BY, GD.MOISTURE, GD.BONUS_PER_QTL, GD.PDC_AMOUNT,GD.PDC_DATE, GD.PDC_PAY_MODE,\r\n" + 
					"WM.VID, WM.RST, WM.NET, WM.WEIGHMENT_DATE, \r\n" + 
					"CVM.CID, CVM.WEIGH_RATE, \r\n" + 
					"CM.NAME, CM.ADDRESS, CM.MOBILE, CM.BLACKLISTED, CM.MEMBERSHIP, \r\n" + 
					"GM.DESCRIPTION GRADE_DESC\r\n" + 
					"FROM GRADE_DETAILS GD, WEIGH_MAST WM, CUSTOMER_VEHICLE_MAST CVM, CUSTOMER_MAST CM, GRADE_MASTER GM\r\n" + 
					"WHERE\r\n" + 
					"GD.GRADE = GM.GRADE AND\r\n" + 
					"GD.WEIGHMENT_ID = WM.ID AND\r\n" + 
					"WM.VID = CVM.ID AND \r\n" + 
					"CVM.CID = CM.ID AND\r\n" + 
					"GD.RST="+rst;
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			SimpleDateFormat formatter1=new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy-MM-dd");
			
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
				jsonObj.put("pdcAmount", rs.getString(10));
				String date = rs.getString("PDC_DATE");
				if(date != null) {
					Date formatPdcDate = formatter1.parse(date);
					String pdcDateStr = formatter2.format(formatPdcDate);
					jsonObj.put("pdcDate", pdcDateStr);
				}
				jsonObj.put("pdcPaymentMode", rs.getString(12));
				jsonObj.put("vehicleId", rs.getString(13));
				jsonObj.put("rst", rs.getString(14));
				jsonObj.put("netQuantity", rs.getString(15));
				Date formatWeighDate = formatter1.parse( rs.getString(16));
				String weighDateStr = formatter2.format(formatWeighDate);
				jsonObj.put("weighmentDate", weighDateStr);
				jsonObj.put("customerId", rs.getString(17));
				jsonObj.put("weighRate", rs.getString(18));
				jsonObj.put("customerName", rs.getString(19));
				jsonObj.put("customerAddress", rs.getString(20));
				jsonObj.put("customerMobile", rs.getString(21));
				jsonObj.put("customerBlacklisted", rs.getInt(22));
				jsonObj.put("customerMembership", rs.getInt(23));
				jsonObj.put("gradeDesc", rs.getString(24));
				
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
						"CM.NAME, \r\n" + 
						"CM.ADDRESS,\r\n" + 
						"CM.MOBILE, \r\n" + 
						"CM.BLACKLISTED, \r\n" + 
						"CM.MEMBERSHIP, \r\n" + 
						"CVM.VEHICLE_NO, \r\n" + 
						"CVM.WEIGH_RATE, \r\n" + 
						"WRM.VEHICLE_NAME, \r\n" + 
						"WM.ID, \r\n" + 
						"WM.MATERIAL, \r\n" + 
						"WM.gross,\r\n" + 
						"wm.grosswt_time,\r\n" + 
						"wm.tare,\r\n" + 
						"wm.tarewt_time,\r\n" + 
						"wm.net,\r\n" + 
						"wm.weighment_date,\r\n" + 
						"wm.WB_OPERATOR\r\n" +
						"FROM \r\n" + 
						"customer_mast CM, \r\n" + 
						"customer_vehicle_mast CVM, \r\n" + 
						"WEIGH_MAST WM,\r\n" + 
						"WEIGH_RATE_MAST WRM\r\n" + 
						"WHERE \r\n" + 
						"WM.VID = CVM.ID AND\r\n" + 
						"CM.ID = CVM.CID AND\r\n" + 
						"CVM.V_TYPE_ID = WRM.ID AND \r\n" + 
						"WM.RST="+rst;
			
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
				jsonObj.put("rst", rst);
				jsonObj.put("wbOperator", rs.getString(17));
				
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
			
			String sql = "SELECT\r\n" + 
					"    WM.RST,\r\n" + 
					"    WM.MATERIAL,\r\n" + 
					"    WM.GROSS,\r\n" + 
					"    WM.GROSSWT_TIME,\r\n" + 
					"    WM.TARE,\r\n" + 
					"    WM.NET,\r\n" + 
					"    WM.TAREWT_TIME,\r\n" + 
					"    WM.WEIGHMENT_DATE,\r\n" + 
					"    CVM.VEHICLE_NO,\r\n" + 
					"    CVM.WEIGH_RATE,\r\n" + 
					"    WRM.VEHICLE_NAME,\r\n" + 
					"    CUST.NAME,\r\n" + 
					"    CUST.ADDRESS,\r\n" + 
					"    CUST.MOBILE,\r\n" + 
					"    COMP.NAME      COMP_NAME,\r\n" + 
					"    COMP.ADDRESS   COMP_NAME,\r\n" + 
					"    COMP.MOBILE    COMP_MOBILE,\r\n" + 
					"    WM.WB_OPERATOR,\r\n" + 
					"    CUST.PHOTO,\r\n" + 
					"    CVM.FRONT_IMG,\r\n" + 
					"    CVM.REAR_IMG,\r\n" + 
					"    CVM.FRONT_TARE_IMG,\r\n" + 
					"    CVM.REAR_TARE_IMG\r\n" + 
					"FROM\r\n" + 
					"    WEIGH_MAST              WM,\r\n" + 
					"    CUSTOMER_VEHICLE_MAST   CVM,\r\n" + 
					"    WEIGH_RATE_MAST         WRM,\r\n" + 
					"    CUSTOMER_MAST           CUST,\r\n" + 
					"    COMPANY_MASTER          COMP\r\n" + 
					"WHERE\r\n" + 
					"    WM.VID = CVM.ID\r\n" + 
					"    AND CVM.CID = CUST.ID\r\n" + 
					"    AND CVM.V_TYPE_ID = WRM.ID\r\n" + 
					"    AND COMP.ID = (\r\n" + 
					"        SELECT\r\n" + 
					"            COMPANY_ID\r\n" + 
					"        FROM\r\n" + 
					"            DAILY_SETUP\r\n" + 
					"        WHERE\r\n" + 
					"            SETUP_DATE = (\r\n" + 
					"                SELECT\r\n" + 
					"                    MAX(SETUP_DATE)\r\n" + 
					"                FROM\r\n" + 
					"                    DAILY_SETUP\r\n" + 
					"            )\r\n" + 
					"    )\r\n" + 
					"    AND WM.ID = "+weighmentId;
			
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
				jsonObj.put("wbOperator", rs.getString(18));
				jsonObj.put("photo", rs.getString(19));
				jsonObj.put("frontPhoto", rs.getString(20));
				jsonObj.put("rearPhoto", rs.getString(21));
				jsonObj.put("frontTarePhoto", rs.getString(22));
				jsonObj.put("rearTarePhoto", rs.getString(23));
				
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
