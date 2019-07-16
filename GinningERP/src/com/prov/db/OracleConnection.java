package com.prov.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class OracleConnection {
	
		public static Connection getConnection() throws ClassNotFoundException
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@localhost:1521:orcl1";
			
			Connection con = null;
			
			try {
				con = DriverManager.getConnection(url, "Vipin", "V");
			}catch (Exception e) {
				e.printStackTrace();
			}
			return con;
		}

	}
