<%@page import="com.prov.bean.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
<div style="width:100%;" class="d-flex justify-content-between align-items-center">
	<div class="d-flex justify-content-center align-items-center">
		<a class="navbar-brand" href="./Dashboard.jsp">Samir Cotton Industries</a>
	</div>
	
	<div style="width:100%;" class="d-flex justify-content-end align-items-center">
	<div style="color:#fff;">
	   <% User currentUser = (User)session.getAttribute("currentSessionUser"); %>
			
       
		<i class="fa fa-bell" aria-hidden="true"></i>&nbsp;&nbsp;
		<i class="fa fa-user" aria-hidden="true">&nbsp;&nbsp;<%= currentUser.getName()%></i> 
	</div>
	&nbsp;&nbsp;
	<button style="margin-bottom:0px;" class="navbar-toggler" type="button" id="toggleBar">
	    <span class="navbar-toggler-icon"></span>
	 </button>
	 </div>
</div>

</nav>
<script>


</script>
	
	