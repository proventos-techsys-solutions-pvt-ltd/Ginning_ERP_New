package com.prov.dbupdation;


public class UpdatePaymentDetails {
	
	/*
	 * public int updatePaymentDetails(PaymentDetails pd) {
	 * 
	 * Connection con = null; int id = 0; try { con =
	 * OracleConnection.getConnection(); } catch (ClassNotFoundException e) {
	 * e.printStackTrace(); }
	 * 
	 * String updatePaymentDetails =
	 * "{ ? = call UPDATE_PAYMENTDETAILS(?,?,?,?,?,?,?) }"; CallableStatement cs;
	 * try { cs = con.prepareCall(updatePaymentDetails);
	 * 
	 * cs.registerOutParameter(1, Types.NUMERIC);
	 * 
	 * cs.setInt(2, pd.getId() ); cs.setInt(2, pd.getInvoiceId() ); cs.setString(3,
	 * pd.getPaymentMode() ); cs.setString(4, pd.getAccountName()); cs.setDouble(5,
	 * pd.getAmount()); cs.setInt(6, pd.getRtgsNo()); cs.setInt(7,
	 * pd.getChequeNo());
	 * 
	 * cs.executeUpdate();
	 * 
	 * id = cs.getInt(1);
	 * 
	 * pd.setId(id);
	 * 
	 * cs.close(); con.close();
	 * 
	 * System.out.println("Updation Succesful-"+id); } catch (SQLException e) {
	 * e.printStackTrace(); }
	 * 
	 * return id;
	 * 
	 * }
	 */
	
}
