<%@page import="com.prov.bean.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
				<img src="../property/img/logo.png" alt="logo" width="200px" height="50px;"> 
            	<button type="button" id="sidebarCollapse" class="btn btn-info logo-margin">
                        <i class="fa fa-bars"></i>
                        <span></span>
                    </button>
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fa fa-bars"></i>
                    </button>
				 <% User currentUser = (User)session.getAttribute("currentSessionUser"); %>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="nav navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link c-nav-link" href="Daily_Setup.jsp">Daily Setup</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link c-nav-link1" href="Grading.jsp">Grading</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link c-nav-link2" href="Invoice.jsp">Invoicing</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link c-nav-link3"  href="#" >User :  &nbsp;<%= currentUser.getName()%></a> 
                            </li>
                        </ul>
                    </div>
            </nav>