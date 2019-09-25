package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;

import com.prov.bean.GradeMaster;
import com.prov.db.OracleConnection;

public class GradeReport {
	
	public ArrayList<GradeMaster> getReport() {
		ResultSet rs = null;
		Connection con = null;
		ArrayList<GradeMaster> gradeList = new ArrayList<GradeMaster>();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT * FROM GRADE_MASTER ORDER BY GRADE";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				GradeMaster gm = new GradeMaster();
				
				gm.setId(rs.getInt(1));
				gm.setGrade(rs.getString(2));
				gm.setDesc(rs.getString(3));
				
				gradeList.add(gm);
				
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(gradeList);
		return gradeList;
	}
	
	
	public JSONArray pendingGradingReport() {
		ResultSet rs = null;
		Connection con = null;
		JSONArray arr = new JSONArray();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT WM.RST, CM.NAME,  WM.NET\r\n" + 
								"FROM WEIGH_MAST WM, CUSTOMER_MAST CM, CUSTOMER_VEHICLE_MAST CVM\r\n" + 
								"WHERE \r\n" + 
								"NOT EXISTS \r\n" + 
								"(SELECT * \r\n" + 
								"FROM GRADE_DETAILS GD \r\n" + 
								"WHERE WM.RST = GD.RST)\r\n" + 
								"AND\r\n" + 
								"WM.VID = CVM.ID AND\r\n" + 
								"CVM.CID = CM.ID AND\r\n" + 
								"WM.NET>0\r\n" + 
								"ORDER BY RST";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				JSONObject obj = new JSONObject();
				
				obj.put("rst",rs.getInt(1));
				obj.put("vendorName",rs.getString(2));
				obj.put("netWeight",rs.getString(3));
				
				arr.put(obj);
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arr;
	}
}
