package com.prov.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.prov.bean.WeighRateMast;
import com.prov.db.OracleConnection;

public class VehicleRateReport {
	
	public ArrayList<WeighRateMast> getReport() {
		ResultSet rs = null;
		Connection con = null;
		ArrayList<WeighRateMast> weighrate = new ArrayList<WeighRateMast>();
		
		try {
			con = OracleConnection.getConnection();
			
			String sql = "SELECT * FROM WEIGH_RATE_MAST ORDER BY WEIGH_RATE DESC";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				WeighRateMast wr = new WeighRateMast();
				
				wr.setId(rs.getInt(1));
				wr.setVehicleName(rs.getString(2));
				wr.setVehicleDesc(rs.getString(3));
				wr.setWeighrate(rs.getFloat(4));
				
				weighrate.add(wr);
				
			}
			
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return weighrate;
	}

}
