<%@page import="com.prov.bean.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<nav class="navbar navbar-expand-lg custom-navbar">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
    <a class="navbar-brand" href="./home.jsp">Samir Cotton Industries</a>
   
    	<div style="width:100%;" class="d-flex justify-content-end align-items-center">
    		 <% User currentUser = (User)session.getAttribute("currentSessionUser"); %>
			<div style="color:#fff;">
				<i class="fa fa-user" aria-hidden="true">&nbsp;</i><a href=""><%= currentUser.getName()%></a>
				&nbsp;&nbsp;&nbsp;
				<i class="fa fa-sign-out" aria-hidden="true">&nbsp;</i><a href="../LogoutServlet">Sign-Out</a>
			</div>
		</div>
  </div>
</nav>