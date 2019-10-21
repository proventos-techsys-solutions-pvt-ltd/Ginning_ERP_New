package com.prov.dbinsertion;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import com.prov.bean.PaymentDetails;
import com.prov.db.OracleConnection;

public class AddPaymentDetails {

public int addPaymentDetails(PaymentDetails pd) {
		
		Connection con = null;
		int id = 0;
		try {
			con = OracleConnection.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String addPaymentDetails = "{ ? = call ADD_PAYMENT_DETAILS(?,?,?,?,?,?,?) }";
		CallableStatement cs;
		try {
			cs = con.prepareCall(addPaymentDetails);
			
			cs.registerOutParameter(1, Types.NUMERIC);
			
			cs.setInt(2, pd.getInvoiceId() );
			cs.setInt(3, pd.getModeId() );
			cs.setLong(4, pd.getAmount());
			cs.setDouble(5, pd.getAmount());
			cs.setInt(6, pd.getPaymentStatus());
			cs.setInt(7, Types.NULL);
			cs.setInt(8, Types.NULL);
			cs.setInt(9, Types.NULL);
					
			cs.executeUpdate();
			
			id = cs.getInt(1);
			
			pd.setId(id);
			
			cs.close();
			con.close();
			
			System.out.println("Insertion Succesful--"+id);
			} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return id;
	}
}
