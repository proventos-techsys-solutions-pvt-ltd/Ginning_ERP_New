package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.json.JSONObject;

import com.prov.bean.Customer;
import com.prov.bean.WeighMast;
import com.prov.db.OracleConnection;

public class RstReport {
	
	public JSONObject getGraderData(String rst) {
		
		ResultSet rs = null;
		Connection con = null;
		JSONObject graderJson = null;
		
		try {
			con = OracleConnection.getConnection();
			
			String weighSql = "SELECT CID, MATERIAL, GROSS, TARE, NET FROM WEIGH_MAST WHERE RST="+rst;
			
			String customerSql = "SELECT NAME, ADDRESS, MOBILE FROM CUSTOMER_MAST WHERE ID=?";
			
			PreparedStatement stmt = con.prepareStatement(weighSql);
			
			rs = stmt.executeQuery();
			
			WeighMast wm = new WeighMast();
			
			while(rs.next()) {
				wm.setCid(rs.getInt(1));
				wm.setMaterial(rs.getString(2));
				wm.setGross(rs.getFloat(3));
				wm.setTare(rs.getFloat(4));
				wm.setNet(rs.getFloat(5));
			}
			
			rs = null;
			
			stmt = con.prepareStatement(customerSql);
			
			stmt.setInt(1, wm.getCid());
			
			rs = stmt.executeQuery();
			
			Customer c = new Customer();
			
			while(rs.next()) {
				c.setName(rs.getString(1));
				c.setAddress(rs.getString(2));
				c.setMobile(rs.getString(3));
			}
			c.setId(wm.getCid());
			
			 graderJson = new JSONObject(wm);
			
			graderJson.append("name", c.getName());
			graderJson.append("address", c.getAddress());
			graderJson.append("mobile", c.getMobile());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return graderJson;
		
	}

}
