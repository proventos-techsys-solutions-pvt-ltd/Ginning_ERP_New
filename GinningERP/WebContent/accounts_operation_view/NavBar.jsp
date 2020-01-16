<%@page import="com.prov.bean.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<nav class="navbar navbar-expand-lg custom-navbar">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  
  <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
    <a class="navbar-brand" href="#"><img src="../property/img/logo.png" alt="logo" width="130px" height="30px;"> </a>
    <ul class="navbar-nav mr-auto mt-2 ">
      <li class="nav-item active">
        <a class="nav-link" href="./Payment.jsp">Vendor Payment <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item active">
        <a class="nav-link" href="./rtgs-neft.jsp">RTGS/NEFT<span class="sr-only">(current)</span></a>
      </li>
      
        <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
          Accounts
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="Record_Expenses.jsp">Expense Journal Entry</a>
      
        </div>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Report
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="Pendin_Amanat.jsp">Amanat Report</a>
          <a class="dropdown-item" href="PurchaseInvoice.jsp">Invoice Report</a>
          <a class="dropdown-item" href="CashReport.jsp">Cash Report</a>
          <a class="dropdown-item" href="RTGSRegister.jsp">RTGS/NEFT Report</a>
        </div>
      </li>
      
      <li class="nav-item active" id="cashier-admin" hidden>
        <a class="nav-link" href="../admin/Dashboard.jsp">Admin View<span class="sr-only">(current)</span></a>
      </li>
       
       
    </ul>
      </div>
    <div  class="d-flex justify-content-end align-items-center">
			<div style="color:#fff;">
			 <% User currentUser = (User)session.getAttribute("currentSessionUser"); %>
				<i class="fa fa-user" aria-hidden="true">&nbsp;</i><a href=""><%= currentUser.getName()%></a>
				&nbsp;&nbsp;&nbsp;
				<i class="fa fa-sign-out" aria-hidden="true">&nbsp;</i><a href="../LogoutServlet">Sign-Out</a>
			</div>
		</div>
</nav>
<script>
var role = <%=currentUser.getRole() %>
if(role===1){
	document.getElementById("cashier-admin").hidden = false;
}








</script>