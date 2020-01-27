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
			
			String sql = "SELECT\r\n" + 
					"    WM.RST,\r\n" + 
					"    CM.NAME,\r\n" + 
					"    WM.NET\r\n" + 
					"FROM\r\n" + 
					"    WEIGH_MAST              WM,\r\n" + 
					"    CUSTOMER_MAST           CM,\r\n" + 
					"    CUSTOMER_VEHICLE_MAST   CVM\r\n" + 
					"WHERE\r\n" + 
					"    NOT EXISTS (\r\n" + 
					"        SELECT\r\n" + 
					"            *\r\n" + 
					"        FROM\r\n" + 
					"            GRADE_DETAILS GD\r\n" + 
					"        WHERE\r\n" + 
					"            WM.RST = GD.RST\r\n" + 
					"    )\r\n" + 
					"        AND WM.VID = CVM.ID\r\n" + 
					"        AND CVM.CID = CM.ID\r\n" + 
					"        AND WM.NET > 0\r\n" + 
					"ORDER BY\r\n" + 
					"    RST";
			
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
	
	public int getGradeRowsCount(int rst) {
		ResultSet rs = null;
		Connection con = null;
		int rowount = 0;
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT\r\n" + 
					"    COUNT(*)\r\n" + 
					"FROM\r\n" + 
					"    GRADE_DETAILS II\r\n" + 
					"WHERE\r\n" + 
					"    II.RST = ?";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			stmt.setInt(1, rst);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				rowount = rs.getInt(1);
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rowount;
	}
}
