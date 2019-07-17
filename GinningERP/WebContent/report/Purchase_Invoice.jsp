<%@ page contentType="application/pdf"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="net.sf.jasperreports.engine.*"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.io.FileNotFoundException"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%
Connection con = null;
String url = "jdbc:oracle:thin:@localhost:1521:orcl3";

try{
//Connecting to Oracle Database
Class.forName("oracle.jdbc.driver.OracleDriver");
con = DriverManager.getConnection(url, "samir", "admin123");

//Loading Jasper file report from local file system.
String jrxmlFile = session.getServletContext().getRealPath("/report/Purchase_Invoice.jrxml");

InputStream input = new FileInputStream(new File(jrxmlFile));

//Generating the report.
JasperReport jasperReport = JasperCompileManager.compileReport(input);

JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, con);

//Exporting Report as PDF
JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());

response.getOutputStream().flush();
response.getOutputStream().close();
}
catch(Exception e){
e.printStackTrace();
}finally{
if(con!=null){
con.close();
}
}
%>