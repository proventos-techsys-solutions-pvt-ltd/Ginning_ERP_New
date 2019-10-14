<%@page import="com.prov.bean.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<nav class="navbar navbar-expand-lg custom-navbar">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
    <a class="navbar-brand" href="#"><img src="../property/img/logo.png" alt="logo" width="200px" height="50px;"> </a>
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item active">
        <a class="nav-link" href="./Payment.jsp">Vendor Payment <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item active">
        <a class="nav-link" href="./rtgs-neft.jsp">RTGS/NEFT Report<span class="sr-only">(current)</span></a>
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