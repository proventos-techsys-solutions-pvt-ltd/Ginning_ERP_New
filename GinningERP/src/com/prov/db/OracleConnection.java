package com.prov.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class OracleConnection {
	
	private static Connection connection = null;
	
		public static Connection getConnection() throws ClassNotFoundException
		{
			//if(connection == null) {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				
				String url = "jdbc:oracle:thin:@192.168.1.3:1521:orcl";
				
				connection = null;
				
				try {
					connection = DriverManager.getConnection(url, "samir", "admin123");
				}catch (Exception e) {
					e.printStackTrace();
				}
			//}
			return connection;
		}

	}
